import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/event/allStartegyEvent.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class AllStrategyListView extends PageList {
  String coinID;
  String mPlatformId;
  final int index;
  AllStrategyListView({Key key, this.index, this.coinID, this.mPlatformId})
      : super(key: key);
  @override
  _allStrategyListViewState createState() => _allStrategyListViewState();
}

class _allStrategyListViewState
    extends PageListState<strategyListModel, AllStrategyListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
    );
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
    //监听事件总线上数据变化
    Application.eventBus.on<allStartegyEvent>().listen((event) {
      if (mounted) {
        setState(() {
          (widget as AllStrategyListView).coinID = event.coinID;
          (widget as AllStrategyListView).mPlatformId = event.mPlatformId;
          loadData(1);
        });
      }
    });
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<strategyListModel>) onSuccess,
      Function onErr}) async {
    try {
      var data = await StrategyServer.getStrategyList(
        ((widget as AllStrategyListView).index),
        ((widget as AllStrategyListView).mPlatformId),
        ((widget as AllStrategyListView).coinID),
      );
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      //  var data = [strategyListModel(), strategyListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(strategyListModel model) {
    return InkWell(
        highlightColor: Colors.transparent,
        radius: 0.0,
        child: Container(
          // 下边框
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xffEAEAEA)))),
          height: height(250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  model.avatar != null
                      ? ClipOval(
                          child: Image.network('${model.avatar}',
                              fit: BoxFit.cover, width: 40, height: 40))
                      : Image.asset('images/home/avatar.png',
                          width: 40, height: 40),
                  SizedBox(
                    width: width(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.normalText('${model.username ?? ''}',
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: width(20),
                          ),
                          Visibility(
                            child: Container(
                              width: width(104),
                              height: height(32),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffFFBBBB),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Text('平台优选',
                                  style: TextStyle(
                                      fontSize: sp(22),
                                      color: Color(0xffD91616))),
                            ),
                            visible: model.is_recommend == 1,
                          )
                        ],
                      ),
                      Utils.normalText('${model.platform ?? ''}交易所',
                          fontSize: 24, color: Color(0xff999999)),
                    ],
                  ),
                  Expanded(child: Text('')),
                  Visibility(
                    child: GestureDetector(
                      child: Container(
                        width: width(160),
                        height: height(70),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff7865FE),
                          borderRadius: BorderRadius.all(Radius.circular(44)),
                        ),
                        child: Text('跟随',
                            style: TextStyle(
                                fontSize: sp(24), color: Colors.white)),
                      ),
                      onTap: () {
                        Toast.showLoading('loading...');
                        Provider.of<StrategyProvider>(context, listen: false)
                            .getnoFollowList(model.id, model.platformId);
                        Provider.of<StrategyProvider>(context, listen: false)
                            .getStrategyDetail(model.id);
                        //延时500毫秒执行
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          //延时执行的代码
                          RouterUtil.pushResult(
                              context,
                              "${StrategyRouter.genDan}?type=${1}&apiId=${model.id}&platformID=${model.platformId}",
                              (result) {});
                        });
                      },
                    ),
                    visible: Provider.of<StrategyProvider>(context,
                                    listen: false)
                                .strategyAccount !=
                            null &&
                        Provider.of<StrategyProvider>(context, listen: false)
                                .strategyAccount
                                .length >
                            0 &&
                        Provider.of<StrategyProvider>(context, listen: false)
                                .strategyAccount[0]
                                .type !=
                            1,
                  )
                ],
              ),
              SizedBox(
                height: height(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.normalText('${model.profitRate ?? 0}%',
                          fontSize: 28, color: Color(0xffFEA665)),
                      SizedBox(
                        height: height(20),
                      ),
                      Utils.normalText('收益率', fontSize: 24),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Utils.normalText('${model.profit ?? 0}%',
                          fontSize: 28, color: Color(0xffFEA665)),
                      SizedBox(
                        height: height(20),
                      ),
                      Utils.normalText('总收益(USDT)', fontSize: 24),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Utils.normalText('${model.count ?? 0}',
                          fontSize: 28, color: Color(0xffFEA665)),
                      SizedBox(
                        height: height(20),
                      ),
                      Utils.normalText('跟随人数', fontSize: 24),
                    ],
                  )),
                ],
              )
            ],
          ),
        ),
        onTap: () {
          RouterUtil.pushResult(
              context,
              "${StrategyRouter.strategyOrderDetail}?apiId=${model.id}",
              (result) {});
        });
  }

  @override
  empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/business/no_task.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text('${Tr.of(context).homeNodata}',
              style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }
}

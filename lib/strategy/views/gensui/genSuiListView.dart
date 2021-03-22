import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/model/genSuiListViewModel.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class genSuiListView extends PageList {
  final int index;
  final int type; //1 是交易员  2 是跟随者
  final String id;
  genSuiListView({Key key, this.index, this.id, this.type}) : super(key: key);
  @override
  _genDanListViewState createState() => _genDanListViewState();
}

class _genDanListViewState
    extends PageListState<genSuiListViewModel, genSuiListView> {
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
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<genSuiListViewModel>) onSuccess,
      Function onErr}) async {
    try {
      var data;
      if ((widget as genSuiListView).type == 1) {
        data = await StrategyServer.getGensuiRecord(
          (widget as genSuiListView).index,
          (widget as genSuiListView).id,
        );
      } else {
        data = await StrategyServer.getGensuiRecord2(
          (widget as genSuiListView).index,
          (widget as genSuiListView).id,
        );
      }
      onSuccess(data);
      //   var data = [genSuiListViewModel(), genSuiListViewModel()];
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(genSuiListViewModel model) {
    return (widget as genSuiListView).type == 1
        ? InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width(30), vertical: width(20)),
              height: height(270),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          model.avatar == null
                              ? Image.asset('images/home/avatar.png',
                                  width: 40, height: 40)
                              : ClipOval(
                                  child: Image.network('${model.avatar}',
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40)),
                          SizedBox(
                            width: width(24),
                          ),
                          Utils.normalText(model.username ?? ""),
                        ],
                      ),
                      /*    Row(
                        children: [
                          Icon(Icons.edit_road_outlined,
                              color: Color(0xffA396FD)),
                          SizedBox(
                            width: width(14),
                          ),
                          Utils.normalText('修改跟随', color: Color(0xffA396FD)),
                        ],
                      ), */
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Utils.normalText('跟随币种', color: Color(0xffA5A5A5)),
                          Container(
                              width: 60,
                              child: Text(
                                '${model.coin ?? ""}',
                                softWrap: true,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xff323232),
                                  fontSize: sp(30),
                                ),
                              )),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.normalText('跟随收益', color: Color(0xffA5A5A5)),
                          Utils.normalText(model.profit ?? ""),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Utils.normalText('跟单手续费', color: Color(0xffA5A5A5)),
                          Utils.normalText(model.fee.toString() ?? ""),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              RouterUtil.pushResult(
                  context,
                  "${StrategyRouter.genSuiDetail}?id=${model.apiId}&type=${(widget as genSuiListView).type.toString()}&follow_api_id=${model.followApiId}&history=${2}",
                  (result) {});
            })
        : InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width(30), vertical: width(20)),
              height: height(270),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          model.avatar == null
                              ? Image.asset('images/home/avatar.png',
                                  width: 50, height: 50)
                              : ClipOval(
                                  child: Image.network('${model.avatar}',
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50)),
                          SizedBox(
                            width: width(24),
                          ),
                          Utils.normalText(model.username ?? ""),
                        ],
                      ),
                      Visibility(
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Image.asset('images/strategy/icon_editext.png',
                                  width: width(35), height: height(35)),
                              SizedBox(
                                width: width(14),
                              ),
                              Utils.normalText('修改跟随',
                                  color: Color(0xffA396FD)),
                            ],
                          ),
                          onTap: () {
                            /*   Provider.of<StrategyProvider>(context, listen: false)
                            .getnoFollowList(
                                (model.id, (model.platformId);
                        Provider.of<StrategyProvider>(context, listen: false)
                            .getStrategyDetail(data[index].id);
                        //延时500毫秒执行
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          //延时执行的代码
                          RouterUtil.pushResult(
                              context,
                              "${StrategyRouter.genDan}?type=${1}&apiId=${data[index].id}&platformID=${data[index].platformId}",
                              (result) {});
                        }); */
                          },
                        ),
                        visible: (widget as genSuiListView).index == 1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Utils.normalText('跟随币种', color: Color(0xffA5A5A5)),
                          Utils.normalText(model.coin ?? ""),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.normalText('跟随收益', color: Color(0xffA5A5A5)),
                          Utils.normalText(model.profit ?? ""),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Utils.normalText('跟单手续费', color: Color(0xffA5A5A5)),
                          Utils.normalText(model.fee.toString() ?? ""),
                        ],
                      )),
                    ],
                  ),
                  /*   SizedBox(
                    height: height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText(model.coin ?? ""),
                      Utils.normalText(model.profit ?? ""),
                      Utils.normalText(model.fee.toString() ?? ""),
                    ],
                  ), */
                ],
              ),
            ),
            onTap: () {
              RouterUtil.pushResult(
                  context,
                  "${StrategyRouter.genSuiDetail}?id=${model.apiId}&type=${(widget as genSuiListView).type.toString()}&follow_api_id=${model.followApiId}&history=${(widget as genSuiListView).index == 1 ? 1 : 2}",
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

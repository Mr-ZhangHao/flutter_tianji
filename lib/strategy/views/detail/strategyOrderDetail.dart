import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/strategy/views/detail/account/accountPage.dart';
import 'package:flutter_tianji/strategy/views/detail/gensui/gensuiRecord.dart';
import 'package:flutter_tianji/strategy/views/detail/trade/tradeRecord.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class strategyOrderDetailPage extends StatefulWidget {
  final String apiId;
  strategyOrderDetailPage({Key key, this.apiId}) : super(key: key);
  @override
  _strategyOrderDetailPageState createState() =>
      _strategyOrderDetailPageState();
}

class _strategyOrderDetailPageState extends State<strategyOrderDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['账户', '交易', '跟随者'];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<StrategyProvider>(context, listen: false)
          .getStrategyDetail(widget.apiId);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            Utils.getCommonAppBar(context, "跟单详情", elevation: 0.2, actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width(50),
                height: height(64),
                margin: EdgeInsets.only(right: width(20)),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Image.asset("images/baike/shoucang@2x.png"),
                  onTap: () {
                    _follow(widget.apiId);
                  },
                ),
              ),
            ],
          )
        ]),
        backgroundColor: Colors.white,
        body: Consumer<StrategyProvider>(builder:
            (BuildContext context, StrategyProvider model, Widget child) {
          return model.mStrategyDetailModel == null
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                      child: Column(children: [
                    SizedBox(
                      height: height(30),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(30)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          model.mStrategyDetailModel.avatar == null
                              ? Image.asset('images/home/avatar.png',
                                  width: width(88), height: height(88))
                              : ClipOval(
                                  child: Image.network(
                                      '${model.mStrategyDetailModel.avatar}',
                                      fit: BoxFit.cover,
                                      width: width(88),
                                      height: height(88))),
                          SizedBox(
                            width: width(24),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Utils.normalText(
                                  '${model.mStrategyDetailModel.username ?? ""}'),
                              Utils.normalText(
                                  '注册时间：${model.mStrategyDetailModel.create_time ?? ""}',
                                  color: Color(0xff999999)),
                              Container(
                                  child: Text(
                                '交易所/币种：${model.mStrategyDetailModel.platform.toUpperCase() + "/" + model.mStrategyDetailModel.coin ?? ""}',
                                softWrap: true,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: sp(28),
                                ),
                              )),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(44)),
                                ),
                                child: Text('跟随',
                                    style: TextStyle(
                                        fontSize: sp(24), color: Colors.white)),
                              ),
                              onTap: () {
                                Toast.showLoading('loading...');
                                Provider.of<StrategyProvider>(context,
                                        listen: false)
                                    .getnoFollowList(
                                        model.mStrategyDetailModel.id,
                                        model.mStrategyDetailModel.platform_id);
                                Provider.of<StrategyProvider>(context,
                                        listen: false)
                                    .getStrategyDetail(
                                        model.mStrategyDetailModel.id);
                                //延时500毫秒执行
                                Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  //延时执行的代码
                                  RouterUtil.pushResult(
                                      context,
                                      "${StrategyRouter.genDan}?type=${1}&apiId=${model.mStrategyDetailModel.id}&platformID=${model.mStrategyDetailModel.platform_id}",
                                      (result) {});
                                });
                              },
                            ),
                            visible: Provider.of<StrategyProvider>(context,
                                            listen: false)
                                        .strategyAccount !=
                                    null &&
                                Provider.of<StrategyProvider>(context,
                                            listen: false)
                                        .strategyAccount
                                        .length >
                                    0 &&
                                Provider.of<StrategyProvider>(context,
                                            listen: false)
                                        .strategyAccount[0]
                                        .type !=
                                    1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height(30),
                    ),
                    Divider(
                      color: Color(0xff59D6D6D6),
                      indent: width(30),
                      endIndent: width(30),
                      height: 0.5,
                    ),
                    SizedBox(
                      height: height(30),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText(
                                '${model.mStrategyDetailModel.care ?? ""}',
                                color: Color(0xffFEA665),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            Utils.normalText('关注人数', fontSize: 24),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText(
                                '${model.mStrategyDetailModel.count ?? ""}',
                                color: Color(0xffFEA665),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            Utils.normalText('跟随人数', fontSize: 24),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: height(30),
                    ),
                    Container(
                      height: height(20),
                      color: Color(0xffF8F6F9),
                    ),
                    Container(
                      width: double.infinity,
                      height: height(80),
                      child: TabBar(
                        isScrollable: false,
                        labelPadding:
                            EdgeInsets.only(left: width(40), right: width(40)),
                        labelColor: Color(0xff7865FE),
                        unselectedLabelColor: Color(0xff323232),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor:
                            Theme.of(context).tabBarTheme.labelColor,
                        controller: _tabController,
                        tabs: _buildTabs(),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                          minHeight: height(800),
                          minWidth: double.infinity,
                          maxHeight: height(800)),
                      child: _tabBarView(model),
                    ),
                  ])),
                );
        }));
  }

  _follow(id) async {
    Toast.showLoading('loading...');
    await StrategyServer.getInterest(id);
    Toast.showText("关注成功");
  }

  Widget _tabBarView(StrategyProvider model) {
    return TabBarView(
      controller: _tabController,
      children: [
        accountPage(
          model: model,
        ),
        tradeRecordPage(),
        gensuiRecordPage(
          apiId: widget.apiId,
        ),
      ],
    );
  }

  List<Widget> _buildTabs() {
    return _tabs
        .asMap()
        .keys
        .map((i) => Container(
            alignment: Alignment.center,
            child: Text(
              _tabs[i],
              textAlign: TextAlign.center,
            )))
        .toList();
  }
}

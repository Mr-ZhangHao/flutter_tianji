import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/views/record/ongoingListView.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class genSuiDetailPage extends StatefulWidget {
  final String follow_api_id;
  final String apiId;
  final String type;
  final String isHistory;
  genSuiDetailPage(
      {Key key, this.follow_api_id, this.type, this.apiId, this.isHistory})
      : super(key: key);
  @override
  _genSuiDetailPageState createState() => _genSuiDetailPageState();
}

class _genSuiDetailPageState extends State<genSuiDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['正在持仓', '历史记录'];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<StrategyProvider>(context, listen: false)
          .getGensuiDetail(widget.apiId, widget.follow_api_id);
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
        backgroundColor: Colors.white,
        appBar: Utils.getCommonAppBar(
          context,
          "跟随详情",
          elevation: 1.0,
        ),
        body: Consumer<StrategyProvider>(builder:
            (BuildContext context, StrategyProvider model, Widget child) {
          return model.mGenSuiListViewModel == null
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                  Container(
                    height: height(140),
                    margin: EdgeInsets.symmetric(horizontal: width(30)),
                    child: Row(
                      children: [
                        model.mGenSuiListViewModel.avatar == null
                            ? Image.asset('images/home/avatar.png',
                                width: 40, height: 40)
                            : ClipOval(
                                child: Image.network(
                                    '${model.mGenSuiListViewModel.avatar}',
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40)),
                        SizedBox(
                          width: width(30),
                        ),
                        Utils.normalText(
                            model.mGenSuiListViewModel.username ?? '',
                            fontWeight: FontWeight.bold),
                        Expanded(child: Text('')),
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
                              /*     Provider.of<StrategyProvider>(context, listen: false)
                            .getnoFollowList(
                                (   model.mGenSuiListViewModel.id, (   model.mGenSuiListViewModel.platformId);
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
                          visible:
                              widget.type != '1' && widget.isHistory == '1',
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height(120),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText('跟随币种', color: Color(0xffA5A5A5)),
                            SizedBox(
                              height: height(10),
                            ),
                            /*    Utils.normalText(
                                '${model.mGenSuiListViewModel.coin}',
                                fontSize: 30), */
                            Container(
                                width: 60,
                                child: Text(
                                  '${model.mGenSuiListViewModel.coin}',
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText('跟随收益', color: Color(0xffA5A5A5)),
                            SizedBox(
                              height: height(10),
                            ),
                            Utils.normalText(
                                '${model.mGenSuiListViewModel.profit}',
                                fontSize: 30),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText('跟单手续费', color: Color(0xffA5A5A5)),
                            SizedBox(
                              height: height(10),
                            ),
                            Utils.normalText(
                                '${model.mGenSuiListViewModel.fee}',
                                fontSize: 30),
                          ],
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: height(300),
                    margin: EdgeInsets.symmetric(horizontal: width(20)),
                    padding: EdgeInsets.symmetric(horizontal: width(20)),
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F4FA),
                        border: new Border.all(
                            color: Color(0xFFF7F4FA), width: width(2)),
                        borderRadius: new BorderRadius.circular(width(8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Utils.normalText('跟随币种：'),
                              Utils.normalText(
                                  '${model.mGenSuiListViewModel.coin}'),
                            ],
                          ),
                          visible: widget.type == '1',
                        ),
                        Visibility(
                          child: SizedBox(
                            height: height(10),
                          ),
                          visible: widget.type == '1',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Utils.normalText('跟随时间：'),
                            Utils.normalText(
                                '${model.mGenSuiListViewModel.createTime}'),
                          ],
                        ),
                        SizedBox(
                          height: height(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Utils.normalText('跟随时长：'),
                            Utils.normalText(
                                '${model.mGenSuiListViewModel.time}'),
                          ],
                        ),
                        SizedBox(
                          height: height(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Utils.normalText('跟随总量：'),
                            Utils.normalText(
                                '${model.mGenSuiListViewModel.size}'),
                          ],
                        ),
                        SizedBox(
                          height: height(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Utils.normalText('跟随笔数：'),
                            Utils.normalText(
                                '${model.mGenSuiListViewModel.count}'),
                          ],
                        ),
                      ],
                    ),
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
                      indicatorColor: Theme.of(context).tabBarTheme.labelColor,
                      controller: _tabController,
                      tabs: _buildTabs(),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        minHeight: height(800),
                        minWidth: double.infinity,
                        maxHeight: height(800)),
                    child: _tabBarView(),
                  ),
                ]));
        }));
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        ongoingListView(
          index: 6,
          apiId: widget.apiId,
          follow_api_id: widget.follow_api_id,
          type: 2,
        ),
        ongoingListView(
          index: 7,
          apiId: widget.apiId,
          follow_api_id: widget.follow_api_id,
          type: 2,
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

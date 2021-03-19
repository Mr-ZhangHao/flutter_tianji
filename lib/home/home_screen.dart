/*
* @message: 主页HOME
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 00:30:00
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/home_screen.dart
*/

import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/event/accountEvent.dart';
import 'package:flutter_tianji/common/event/userInfoEvent.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/home/provider/index.dart';
import 'package:flutter_tianji/home/routes/index.dart';
import 'package:flutter_tianji/home/widgets/home_widget/banner.dart';
import 'package:flutter_tianji/home/widgets/home_widget/marked_list.dart';
import 'package:flutter_tianji/home/widgets/home_widget/noties.dart';
import 'package:flutter_tianji/home/widgets/home_widget/share_banner.dart';
import 'package:flutter_tianji/login/provider/user_provider.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/mine/routes/index.dart';
import 'package:flutter_tianji/providers/gloable_provider.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/routes/routes.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  List<String> _tabs = ['自选', '合约', '币币'];
  String avatar;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<MineProvider>(context, listen: false).getUserInfo();
      Provider.of<HomeProvider>(context, listen: false).getBanner();
      Provider.of<HomeProvider>(context, listen: false).getNotices();
      Provider.of<MineProvider>(context, listen: false).getRecommendApi();
    });
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 0);
    WallerProvider model1 = Provider.of<WallerProvider>(context, listen: false);
    model1.getBibiAsset();
    model1.getCoinList();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Color(0xffF9F8FA),
      //  appBar: homeAppBarWidget(),
      body: SingleChildScrollView(child: Consumer<MineProvider>(
          builder: (BuildContext context, MineProvider model, Widget child) {
        return Column(
          children: <Widget>[
            Container(
              height: height(582),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  AppBarBanner(child: SwiperBanner()),
                  Container(
                    margin: EdgeInsets.only(
                        left: width(20),
                        right: width(20),
                        top: statusBarHeight),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (model.userInfo != null &&
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .isLogin) {
                                  RouterUtil.push(context, MineRouter.mine);
                                } else {
                                  RouterUtil.push(context, Routes.login);
                                }
                              },
                              child: Row(
                                children: [
                                  model.userInfo == null ||
                                          model.userInfo.avatar == null
                                      ? Image.asset('images/home/avatar.png',
                                          width: width(60), height: height(60))
                                      : ClipOval(
                                          child: Image.network(
                                              '${model.userInfo?.avatar}',
                                              width: 30,
                                              fit: BoxFit.cover,
                                              height: 30),
                                        ),
                                  SizedBox(
                                    width: width(32),
                                  ),
                                  model.userInfo == null
                                      ? Text(
                                          '未登录',
                                          style: TextStyle(
                                              color: kWhite, fontSize: sp(34)),
                                        )
                                      : Text('${model.userInfo?.username}',
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontSize: sp(34))),
                                ],
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            RouterUtil.push(context, HomeRouter.search);
                          },
                          child: Container(
                            width: width(210),
                            height: width(60),
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(width(30))),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width(22),
                                ),
                                Image.asset(
                                  'images/home/search.png',
                                  width: width(28),
                                  height: height(28),
                                ),
                                SizedBox(
                                  width: width(22),
                                ),
                                Text(
                                  '搜索',
                                  style: TextStyle(
                                      color: Color(0xffB8B8B8),
                                      fontSize: sp(26)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          color: Color(0xff323232),
                          icon: ImageIcon(
                            AssetImage(
                              'images/home/server.png',
                            ),
                            color: Color(0XFFFFFFFF),
                          ),
                          onPressed: () {
                            if (model.userInfo != null) {
                              print('chatUrl:' + model.userInfo.chatUrl);
                              RouterUtil.goWebViewPage(
                                  context,
                                  Tr.of(context).homeCustomerService,
                                  model.userInfo.chatUrl);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width(40), right: width(40)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(300),
                        ),
                        Container(
                          height: height(88),
                          child: NoticesBarWidget(),
                        ),
                        _homeTabWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            /*      GestureDetector(
                //  onTap: () => RouterUtil.push(context, MineRouter.share),
                child: ShareBanner()),*/

            _PolicyRecommended(model.recommendList),
            SizedBox(
              height: height(20),
            ),
            _rankinglist(),
            SizedBox(
              height: height(50),
            ),
          ],
        );
      })),
    );
  }

  _rankinglist() {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))), //设置圆角
        margin: EdgeInsets.only(left: width(40), right: width(40)),
        child: Padding(
          padding: EdgeInsets.all(width(30)),
          child: Column(children: [
            Row(
              children: [
                Container(
                  width: width(4),
                  height: height(30),
                  color: Colors.black,
                ),
                SizedBox(
                  width: width(20),
                ),
                Expanded(
                  child: Text(
                    '排行榜',
                    style: TextStyle(
                        color: Color(0xff323232),
                        fontSize: sp(32),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '更多',
                  style: TextStyle(color: kPrimaryColor, fontSize: sp(24)),
                ),
                SizedBox(
                  width: width(10),
                ),
                Image.asset('images/home/more.png',
                    width: width(28), height: height(28)),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height(50),
                    ),
                    rankWidget(2, '', '交易员', '900.88%', Color(0xff4530D7),
                        Color(0xff280E91)),
                  ],
                ),
                SizedBox(
                  width: width(24),
                ),
                rankWidget(1, '', '交易员', '5822.68%', Color(0xff6F22BE),
                    Color(0xff5B00B8)),
                SizedBox(
                  width: width(24),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height(50),
                    ),
                    rankWidget(3, '', '交易员', '900.88%', Color(0xffC86F2F),
                        Color(0xffCC3800))
                  ],
                ),
              ],
            ),
          ]),
        ));
  }

  Widget rankWidget(type, image, text, number, textColor, numbuerColor) {
    return Container(
      alignment: Alignment.center,
      height: height(244),
      width: width(184),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: type == 1
                ? AssetImage("images/wallet/rank1.png")
                : type == 2
                    ? AssetImage("images/wallet/rank2.png")
                    : AssetImage("images/wallet/rank3.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          SizedBox(
            height: height(55),
          ),
          Container(
            width: width(60),
            height: height(60),
            child: image == ''
                ? Image.asset('images/mine/avatar.png')
                : Image.network(image),
          ),
          SizedBox(
            height: height(50),
          ),
          Utils.normalText('${text}', fontSize: 24, color: textColor),
          Utils.normalText('${number}', fontSize: 24, color: numbuerColor),
        ],
      ),
    );
  }

  _PolicyRecommended(List<strategyListModel> data) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))), //设置圆角
        margin: EdgeInsets.only(left: width(40), right: width(40)),
        child: Padding(
          padding: EdgeInsets.all(width(30)),
          child: Column(
            children: [
              InkWell(
                child: Row(
                  children: [
                    Container(
                      width: width(4),
                      height: height(30),
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: width(20),
                    ),
                    Expanded(
                      child: Text(
                        '策略推荐',
                        style: TextStyle(
                            color: Color(0xff323232),
                            fontSize: sp(32),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '更多',
                      style: TextStyle(color: kPrimaryColor, fontSize: sp(24)),
                    ),
                    SizedBox(
                      width: width(10),
                    ),
                    Image.asset('images/home/more.png',
                        width: width(28), height: height(28)),
                  ],
                ),
                onTap: () {
                  Provider.of<GloableProvider>(context, listen: false)
                      .setCurrIndex(2);
                },
              ),
              Container(
                height: height(820),
                child: data.length == 0
                    ? Container()
                    : MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  child: Container(
                                    // 下边框
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 0.5,
                                                color: Color(0xffEAEAEA)))),
                                    height: height(250),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            data[index].avatar == null
                                                ? Image.asset(
                                                    'images/home/icon_quantify.png',
                                                    width: 40,
                                                    height: 40)
                                                : ClipOval(
                                                    child: Image.network(
                                                        '${data[index].avatar}',
                                                        fit: BoxFit.cover,
                                                        width: 40,
                                                        height: 40)),
                                            SizedBox(
                                              width: width(20),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Utils.normalText(
                                                        '${data[index].username ?? ""}',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    SizedBox(
                                                      width: width(20),
                                                    ),
                                                    Visibility(
                                                      child: Container(
                                                        width: width(104),
                                                        height: height(32),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border(
                                                              top: BorderSide(
                                                                color: Color(
                                                                    0xffD45151),
                                                                width: 0.5,
                                                              ),
                                                              bottom:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xffD45151),
                                                                width: 0.5,
                                                              ),
                                                              left: BorderSide(
                                                                color: Color(
                                                                    0xffD45151),
                                                                width: 0.5,
                                                              ),
                                                              right: BorderSide(
                                                                color: Color(
                                                                    0xffD45151),
                                                                width: 0.5,
                                                              )),
                                                          color:
                                                              Color(0xffFFBBBB),
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(0),
                                                              topRight: Radius
                                                                  .circular(8),
                                                              bottomLeft: Radius
                                                                  .circular(8),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                        ),
                                                        child: Text('平台优选',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    sp(22),
                                                                color: Color(
                                                                    0xffD91616))),
                                                      ),
                                                      visible: data[index]
                                                              .is_recommend ==
                                                          1,
                                                    )
                                                  ],
                                                ),
                                                Utils.normalText(
                                                    '${data[index].platform ?? ''}交易所',
                                                    fontSize: 24,
                                                    color: Color(0xff999999)),
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
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                44)),
                                                  ),
                                                  child: Text('跟随',
                                                      style: TextStyle(
                                                          fontSize: sp(24),
                                                          color: Colors.white)),
                                                ),
                                                onTap: () {
                                                  Toast.showLoading(
                                                      'loading...');
                                                  Provider.of<StrategyProvider>(
                                                          context,
                                                          listen: false)
                                                      .getnoFollowList(
                                                          data[index].id,
                                                          data[index]
                                                              .platformId);
                                                  Provider.of<StrategyProvider>(
                                                          context,
                                                          listen: false)
                                                      .getStrategyDetail(
                                                          data[index].id);
                                                  //延时500毫秒执行
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000),
                                                      () {
                                                    //延时执行的代码
                                                    RouterUtil.pushResult(
                                                        context,
                                                        "${StrategyRouter.genDan}?type=${1}&apiId=${data[index].id}&platformID=${data[index].platformId}",
                                                        (result) {});
                                                  });
                                                },
                                              ),
                                              visible: Provider.of<
                                                                  StrategyProvider>(
                                                              context,
                                                              listen: false)
                                                          .strategyAccount !=
                                                      null &&
                                                  Provider.of<StrategyProvider>(
                                                              context,
                                                              listen: false)
                                                          .strategyAccount
                                                          .length >
                                                      0 &&
                                                  Provider.of<StrategyProvider>(
                                                              context,
                                                              listen: false)
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Utils.normalText(
                                                    '${data[index].profitRate ?? 0}%',
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFEA665)),
                                                SizedBox(
                                                  height: height(20),
                                                ),
                                                Utils.normalText('收益率',
                                                    fontSize: 24),
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Utils.normalText(
                                                    '${data[index].profit ?? 0}%',
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFEA665)),
                                                SizedBox(
                                                  height: height(20),
                                                ),
                                                Utils.normalText('总收益(USDT)',
                                                    fontSize: 24),
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Utils.normalText(
                                                    '${data[index].count ?? 0}',
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFEA665)),
                                                SizedBox(
                                                  height: height(20),
                                                ),
                                                Utils.normalText('跟随人数',
                                                    fontSize: 24),
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
                                        "${StrategyRouter.strategyOrderDetail}?apiId=${data[index].id}",
                                        (result) {});
                                  });
                            })),
              )
            ],
          ),
        ));
  }

  _homeTabWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // 底色
        boxShadow: [
          BoxShadow(
            blurRadius: width(4), //阴影范围
            spreadRadius: width(1), //阴影浓度
            color: Color(0xffF2EAF3), //阴影颜色
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Padding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  /*  onTap: () =>
                                  RouterUtil.push(context, WalletRouter.recharge),*/
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/home/tab1.png',
                          width: width(48), height: height(48)),
                      SizedBox(
                        height: height(20),
                      ),
                      Container(
                        child: Text('智能策略',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff969696),
                                fontSize: sp(28),
                                height: 1.1)),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  /*  onTap: () => RouterUtil.push(
                                  context, WalletRouter.withdrawDetail),*/
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/home/tab2.png',
                          width: width(48), height: height(48)),
                      SizedBox(
                        height: height(20),
                      ),
                      Container(
                        child: Text('行情资讯',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff969696),
                                fontSize: sp(28),
                                height: 1.1)),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                /*          onTap: () =>
                           RouterUtil.push(context, WalletRouter.transformation),*/
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/home/tab3.png',
                        width: width(48), height: height(48)),
                    SizedBox(
                      height: height(20),
                    ),
                    Container(
                      child: Text('商业API',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff969696),
                              fontSize: sp(28),
                              height: 1.1)),
                    ),
                  ],
                ),
                onTap: () {
                  RouterUtil.push(context, BaikeRouter.Radars);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                /*          onTap: () =>
                           RouterUtil.push(context, WalletRouter.transformation),*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/home/tab4.png',
                        width: width(48), height: height(48)),
                    SizedBox(
                      height: height(20),
                    ),
                    Container(
                      child: Text('邀请好友',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff969696),
                              fontSize: sp(28),
                              height: 1.1)),
                    ),
                  ],
                ),
                onTap: () {
                  RouterUtil.push(context, MineRouter.share);
                },
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: height(20), bottom: height(30)),
      ),
    );
  }
}

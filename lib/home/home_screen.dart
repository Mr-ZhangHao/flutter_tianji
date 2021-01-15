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

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/home/routes/index.dart';
import 'package:flutter_tianji/home/widgets/home_widget/banner.dart';
import 'package:flutter_tianji/home/widgets/home_widget/marked_list.dart';
import 'package:flutter_tianji/home/widgets/home_widget/noties.dart';
import 'package:flutter_tianji/home/widgets/home_widget/share_banner.dart';
import 'package:flutter_tianji/mine/routes/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';

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
  // List<String> _tabs = ['自选'];
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 0);
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
      //  appBar: homeAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height(582),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  AppBarBanner(child: SwiperBanner()),
                  Container(
                    margin: EdgeInsets.only(
                        left: width(40),
                        right: width(40),
                        top: statusBarHeight),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () =>
                                  RouterUtil.push(context, MineRouter.mine),
                              child: Row(
                                children: [
                                  Image.asset('images/home/avatar.png',
                                      width: width(60), height: height(60)),
                                  SizedBox(
                                    width: width(32),
                                  ),
                                  Text(
                                    '未登录',
                                    style: TextStyle(
                                        color: kWhite, fontSize: sp(34)),
                                  ),
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
                                Image.asset('images/home/search.png',
                                    width: width(28), height: height(28)),
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width(40), right: width(40)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(328),
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
            SizedBox(
              height: height(30),
            ),
            Card(
                elevation: 15.0, //设置阴影
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))), //设置圆角
                margin: EdgeInsets.only(left: width(40), right: width(40)),
                child: Padding(
                  padding: EdgeInsets.all(width(30)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '区块链项目',
                              style: TextStyle(
                                  color: Color(0xff323232),
                                  fontSize: sp(32),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '查看更多',
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: sp(24)),
                          ),
                          SizedBox(
                            width: width(10),
                          ),
                          Image.asset('images/home/more.png',
                              width: width(28), height: height(28)),
                        ],
                      ),
                      SizedBox(
                        height: height(20),
                      ),
                      Container(
                        height: height(380),
                        child: MarketListView(),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _homeTabWidget() {
    return Container(
      height: height(166),
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
                      height: height(22),
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
                      height: height(22),
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
                    height: height(22),
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
                    height: height(22),
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
    );
  }
}

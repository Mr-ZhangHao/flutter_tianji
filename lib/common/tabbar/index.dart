/*
* @message: tabBar 底部导航按钮以及显示的页面
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-11 16:50:49
* @LastEditors: Jack
* @LastEditTime: 2020-08-26 10:06:10
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/tabbar/index.dart
*/

// import 'package:ETF/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tianji/baike/baikai.dart';
import 'package:flutter_tianji/business/business_screen.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/update/index.dart';
import 'package:flutter_tianji/course/course_screen.dart';
import 'package:flutter_tianji/home/home_screen.dart';
import 'package:flutter_tianji/login/login_screen.dart';
import 'package:flutter_tianji/login/provider/user_provider.dart';
import 'package:flutter_tianji/providers/gloable_provider.dart';
import 'package:flutter_tianji/providers/provider_widget.dart';
import 'package:flutter_tianji/strategy/strategy_screen.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/sp_utils.dart';
import 'package:flutter_tianji/wallet/wallet_screen.dart';
import 'package:provider/provider.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  GlobalKey bottomNavigationBarKey = GlobalKey();
  List<BottomNavigationBarItem> list = [
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/home02.png',
          width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/home01.png',
          width: width(44), height: width(44)),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/zixun02.png',
          width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/zixun01.png',
          width: width(44), height: width(44)),
      title: Text('项目百科'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/clk02.png',
          width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/clk01.png',
          width: width(44), height: width(44)),
      title: Text('策略库'),
    ),

    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/course02.png',
          width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/course01.png',
          width: width(44), height: width(44)),
      title: Text('课程'),
    ),
/*    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/shangye02.png',
          width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/shangye01.png',
          width: width(44), height: width(44)),
      title: Text('商业API'),
    ),*/
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/zican02.png',
          width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/zican01.png',
          width: width(44), height: width(44)),
      title: Text('资产'),
    ),
  ];
  final List<Widget> _pageList = [
    HomeScreen(), // 首页
    Baike(), // 项目百科
    strategyScreen(), //策略跟单
    course_screen(), // 商业API
    WalletScreen(), // 资产
    //   ContractScreen(), // 合约
  ];

  bool isLogin = false;

  @override
  void initState() {
    super.initState();
   UpdateUtil().checkVersion(context);
  }

  @override
  Widget build(BuildContext context) {
    list = [
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/home02.png',
            width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/home01.png',
            width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainHome),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/zixun02.png',
            width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/zixun01.png',
            width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainEncyclopedia),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/clk02.png',
            width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/clk01.png',
            width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainStrategy),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/course02.png',
            width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/course01.png',
            width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainCourse),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/zican02.png',
            width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/zican01.png',
            width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainAssets),
      )
    ];
    final String token = SpUtils.sp.getString('token');
    final bool isLogin = token != null && token != '';
    return ProviderWidget<UserProvider>(
      model: UserProvider(),
      builder: (BuildContext context, UserProvider userModel, Widget child) {
        if (isLogin) {
          return Container(
              child: Consumer<GloableProvider>(
                  builder: (_, provider, __) => Scaffold(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        body: this._pageList[provider.bottomCurrIndex],
                        bottomNavigationBar: BottomNavigationBar(
                          key: bottomNavigationBarKey,
                          backgroundColor:
                              Theme.of(context).bottomAppBarTheme.color,
                          type: BottomNavigationBarType.fixed, //可以有多个按钮
                          currentIndex: provider.bottomCurrIndex,
                          selectedFontSize: sp(22),
                          unselectedFontSize: sp(22),
                          selectedItemColor:
                              Theme.of(context).tabBarTheme.labelColor,
                          unselectedItemColor: kTextColor6,
                          onTap: (int index) {
                            provider.setCurrIndex(index);
                          },
                          items: this.list,
                        ),
                      )));
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

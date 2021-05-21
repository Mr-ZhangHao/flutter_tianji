/*
* @message: 登录注册
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-09-03 11:02:13
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/login_screen.dart
*/



import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'file:///D:/android_worke/flutter_demo/TianJi/flutter_tianji/lib/login/views/page/login/EmailLoginPage.dart';
import 'file:///D:/android_worke/flutter_demo/TianJi/flutter_tianji/lib/login/views/page/login/PhoneLoginPage.dart';
import 'package:flutter_tianji/utils/screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin
 {
  TabController _tabController;
  List<String> _tabs = ['邮箱登陆', '手机登录'];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this,length: _tabs.length, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabs = [Tr.of(context).LoginEmail, Tr.of(context).LoginPhone];
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
      /*  appBar: AppBar(
          elevation: 0,
          backgroundColor: kTransprant,
        ),*/
        body: SingleChildScrollView(
          child: Container(
            padding:EdgeInsets.symmetric(horizontal: width(30)) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
         /*       Container(
                  width: double.infinity,
                  child: Image.asset(
                    'images/login/bg.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: height(30)),*/
                SizedBox(height: MediaQuery.of(context).padding.top+10),

                Container(
                  margin: EdgeInsets.only(left: width(35)),

                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: height(80),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                  ),
                  child: Text(
                    Tr.of(context).WelcomeLogin,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: sp(48),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width:width(380),
                  height: height(65),

                  child: TabBar(
                    isScrollable: false,
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: Color(0xff323232),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Theme.of(context).tabBarTheme.labelColor,
                    controller: _tabController,
                    tabs: _buildTabs(),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - height(617),
                  decoration: BoxDecoration(color: kWhite),
                  child: _tabBarView(),
                )
              ],

              // LoginFromWidget(),
            ),
          ),
        ),
      // resizeToAvoidBottomPadding: false,
      //  resizeToAvoidBottomInset: false,
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [EmailLoginWidget(), PhoneLoginWidget()],
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
              style: TextStyle(fontSize: sp(28)),
              textAlign: TextAlign.center,
            )))
        .toList();
  }


}

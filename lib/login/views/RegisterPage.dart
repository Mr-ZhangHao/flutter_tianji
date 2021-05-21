/*
* @message: 登录注册
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-09-01 14:40:22
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/views/RegisterPage.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/login/views/page/register/PhoneRegisterPage.dart';
import 'file:///D:/android_worke/flutter_demo/TianJi/flutter_tianji/lib/login/views/page/login/EmailLoginPage.dart';
import 'file:///D:/android_worke/flutter_demo/TianJi/flutter_tianji/lib/login/views/page/register/EmailRegisterPage.dart';
import 'file:///D:/android_worke/flutter_demo/TianJi/flutter_tianji/lib/login/views/page/login/PhoneLoginPage.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/routes/routes.dart';
import 'package:flutter_tianji/utils/screen.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>   with SingleTickerProviderStateMixin
{
  TabController _tabController;
  List<String> _tabs = ['邮箱注册', '手机注册'];

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

    _tabs = ['${Tr.of(context).emailRegistration}', '${Tr.of(context).phoneRegistration}'];
    return Container(

      child: Scaffold(
        backgroundColor:  Color(0xffFFFFFF),
    /*    appBar: AppBar(
          elevation: 0,
          backgroundColor: kTransprant,
        ),*/
        body: SingleChildScrollView(
          child: Container(
            padding:EdgeInsets.symmetric(horizontal: width(30)) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
   /*             Container(
                  width: double.infinity,
                  child: Image.asset(
                    'images/login/bg.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),*/
                SizedBox(height: MediaQuery.of(context).padding.top+10),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: height(80),
                  margin: EdgeInsets.only(left: width(35)),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                  ),
                  child: Text(
                    '${Tr.of(context).WelcomeRegister}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: sp(48),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width:width(380),
                  height: height(80),
                  alignment: Alignment.centerLeft,
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
      //  resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [EmailRegisterWidget(), PhoneRegisterWidget()],
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

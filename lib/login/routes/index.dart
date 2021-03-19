/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Jack
* @LastEditTime: 2020-08-18 13:57:22
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/routes/index.dart
*/
import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/login/views/RegisterPage.dart';
import 'package:flutter_tianji/login/views/country.dart';
import 'package:flutter_tianji/login/views/page/forgot/Forgot1Page.dart';
import 'package:flutter_tianji/login/views/page/forgot/Forgot2Page.dart';
import 'package:flutter_tianji/login/views/page/register/SetPwdPage.dart';
import 'package:flutter_tianji/routes/router_init.dart';

class LoginRouter implements IRouterProvider {
  static String register = '/register';
  static String forgot = '/forgot';
  static String forgot2 = '/forgot2';
  static String setpwd = '/setpwd';
  static String country = '/country';

  @override
  void initRouter(FluroRouter router) {
    // example
    // 注册
    router.define(register, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      // Map<String, dynamic> item = json.decode(params['param'].first);
      // NoticeModel noticeModel = NoticeModel.fromJson(item);
      return RegisterPage();
    }));

    // 忘记密码
    router.define(forgot, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return Forgot1PageWidget();
    }));

    // 忘记密码
    router.define(forgot2, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String account = params['account'].first;
      return Forgot2PageWidget(
        account: account,
      );
    }));
    router.define(country, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return countryPage();
    }));

    // 设置密码
    router.define(setpwd, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String Name = params['name'].first;
      String code = params['code'].first;
      String area = params['area'].first;
      String type = params['type'].first;
      return SetPwdPageWidget(
        name: Name,
        code: code,
        area: area,
        type: type,
      );
    }));

    router.define(country, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return countryPage();
    }));
  }
}

/*
* @message: luro的路由跳转工具类
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-10 15:02:58
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 20:31:28
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/routes/fluro_navigator.dart
*/
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes.dart';
import 'application.dart';
import 'package:flutter/cupertino.dart';

/// luro的路由跳转工具类
class RouterUtil {
  //不需要页面返回值的跳转
  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }

  //需要页面返回值的跳转
  static pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print('$error');
    });
  }

  /// 直接返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  /// 跳到WebView页
  static void goWebViewPage(BuildContext context, String title, String url) {
    //fluro 不支持传中文,需转换
    push(context,
        '${Routes.webViewPage}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }
}

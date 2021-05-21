import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/business/routes/index.dart';
import 'package:flutter_tianji/common/tabbar/index.dart';
import 'package:flutter_tianji/course/routes/index.dart';
import 'package:flutter_tianji/home/routes/index.dart';
import 'package:flutter_tianji/login/login_screen.dart';
import 'package:flutter_tianji/login/routes/index.dart';
import 'package:flutter_tianji/mine/routes/index.dart';
import 'package:flutter_tianji/routes/router_init.dart';
import 'package:flutter_tianji/routes/webView.dart';
import 'package:flutter_tianji/splash/splash_page.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/wallet/routes/index.dart';
import '404.dart';
import 'package:flutter/material.dart' hide Router;

class Routes {
  static String home = '/home';
  static String splash = 'splash';
  static String login = '/login';
  static String webViewPage = '/webViewPage';
  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(FluroRouter router) {
    /// 指定路由跳转错误返回页 404页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return WidgetNotFound();
    });

    // 启动页
    router.define(splash,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    SplashPage()));
    // 主页
    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    BottomTabBar()));
    // 跳转webview
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    router.define(login,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    LoginScreen()));
    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    // 主页路由组
    _listRouter.add(HomeRouter()); // 主页
    _listRouter.add(BaikeRouter()); // 百科
    _listRouter.add(MineRouter()); // 我的
    _listRouter.add(WalletRouter()); // 钱包
    _listRouter.add(StrategyRouter()); // 策略
    _listRouter.add(CourseRouter()); // 策略
    _listRouter.add(LoginRouter()); // 登录注册相关
    _listRouter.add(BusinessRouter()); // 商业API

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}

// PS：路由使用方法

//  1、不需要传参的 替换所有历史记录
/// Router.push(context, LoginRouter.loginPage, replace: true);
/// 2、不需要传参的 不替换历史记录
/// Router.push(context, LoginRouter.loginPage, replace: false);

//  需要传参的
//  3、Router.push(context,'${Routes.webViewPage}?param1=${Uri.encodeComponent(content1)}&param2=${Uri.encodeComponent(content2)}', replace: true);
//  4、Router.push(context, '${MarketRouter.hotCoin}?id=xxxxxxx');

// 有返回值跳转
/// 5、Router.pushResult(context, MarketRouter.hotCoin, (result){
//   setState(() {
//     //result是返回的结果
//     TestModel model = result;
//     _name = model.name;
//   });
// });

// 返回上一级
// 6、Router.goBack(context);

// 带参数返回上一级
// 7、Router.goBackWithParams(context, result);

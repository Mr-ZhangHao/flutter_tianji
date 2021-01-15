import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/baike/view/myCollection.dart';
import 'package:flutter_tianji/baike/view/projectDetil.dart';
import 'package:flutter_tianji/routes/router_init.dart';
import 'package:flutter_tianji/utils/RadarPage.dart';

class BaikeRouter implements IRouterProvider {
  static String mycollection = '/myCollection';
  static String projectDetil = '/projectDetilPage';
  static String Radars = '/RadarPage';

  @override
  void initRouter(FluroRouter router) {
    router.define(mycollection,
        handler: Handler(handlerFunc: (_, __) => myCollection()));
    router.define(projectDetil,
        handler: Handler(handlerFunc: (_, __) => projectDetilPage()));
    router.define(Radars,
        handler: Handler(handlerFunc: (_, __) => RadarPage()));
  }
}

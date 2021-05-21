import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/baike/view/myCollection.dart';
import 'package:flutter_tianji/baike/view/newsDetail.dart';
import 'package:flutter_tianji/baike/view/projectDetil.dart';
import 'package:flutter_tianji/routes/router_init.dart';
import 'package:flutter_tianji/utils/RadarPage.dart';

class BaikeRouter implements IRouterProvider {
  static String mycollection = '/myCollection';
  static String projectDetils = '/projectDetilPage';
  static String Radars = '/RadarPage';
  static String newsDetails = '/newsDetail';

  @override
  void initRouter(FluroRouter router) {
    router.define(mycollection,
        handler: Handler(handlerFunc: (_, __) => myCollection()));

    router.define(projectDetils, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String id = params['type']?.first;
      return projectDetilPage(id: id,);
    }));
    router.define(Radars,
        handler: Handler(handlerFunc: (_, __) => RadarPage()));

    router.define(newsDetails, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      final String title = params['title']?.first;
      final String content = params['contents']?.first;
      final String name = params['name']?.first;
      final String time = params['time']?.first;
      final String image = params['image']?.first;
      print("object2"+title);
      print("object"+content);
      return newsDetail(title: title, contents: content,name: name,time: time,image: image,);
    }));
  }


}

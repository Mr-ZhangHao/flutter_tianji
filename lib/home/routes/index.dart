/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 20:15:08
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/routes/index.dart
*/
import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/home/views/notice.dart';
import 'package:flutter_tianji/home/views/notices_detail.dart';
import 'package:flutter_tianji/home/views/ranking.dart';
import 'package:flutter_tianji/home/views/search_coin.dart';
import 'package:flutter_tianji/routes/router_init.dart';

class HomeRouter implements IRouterProvider {
  static String notice = '/notice';
  static String noticeDetail = '/noticeDetail';
  static String search = '/search';
  static String rankings = '/ranking';

  @override
  void initRouter(FluroRouter router) {
    // 公告
    router.define(notice, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      // Map<String, dynamic> item = json.decode(params['param'].first);
      // NoticeModel noticeModel = NoticeModel.fromJson(item);
      return NoticesPage();
    }));

    // 公告详情
    router.define(noticeDetail, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return NoticesDetailPage();
    }));

    // 搜索
    router.define(search, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return SearchCoinPage();
    }));

    // 排行榜
    router.define(rankings, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return ranking();
    }));


  }
}

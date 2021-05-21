import 'package:flutter_tianji/baike/model/projectListModel.dart';
import 'package:flutter_tianji/core/network/http.dart';
import 'package:flutter_tianji/home/model/banner_model.dart';
import 'package:flutter_tianji/home/model/rankingModel.dart';

class HomeServer {
  static Future<List<BannerModel>> getBanner() async {
    var res = await http.get('/api/home/banner');
    return (res.data['data'] as List)
        .map((e) => BannerModel.fromJson(e))
        .toList();
  }

  static Future getNotices() async {
    var res = await http.get('/api/home/notice');
    return res.data;
  }

  static Future getRecommendApi() async {
    var res = await http.get('/api/home/recommendApi');
    return res.data;
  }

  static Future  getProjectRecommend() async {
    var res = await http.get('/api/encyclopedia/index');
    return res.data;
  }

  static Future  getNewsRecommend() async {
    var res = await http.get('/api/journalism/index');
    return res.data;
  }


  static Future<List<rankingModel>> getranking() async {
    //   var data = {"id": id};
    var res = await http.get('/api/strategy/ranking');
    return (res.data['data'] as List)
        .map((e) => rankingModel.fromJson(e))
        .toList();
  }

}

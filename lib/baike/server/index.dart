import 'package:flutter_tianji/baike/model/BannerNewModel.dart';
import 'package:flutter_tianji/baike/model/NewsListModel.dart';
import 'package:flutter_tianji/baike/model/collectionListModel.dart';
import 'package:flutter_tianji/baike/model/projectDetailModel.dart';
import 'package:flutter_tianji/baike/model/projectListModel.dart';
import 'package:flutter_tianji/baike/model/screenTypeModel.dart';
import 'package:flutter_tianji/core/network/http.dart';

class baikeServer{

  static Future<List<projectListModel>> getprojectList(data) async {
    var res = await http.get('/api/encyclopedia/index',queryParameters: data);
    return (res.data['data'] as List).map((e) => projectListModel.fromJson(e)).toList();
  }

  static Future<List<collectionListModel>> getCollectionList() async {
    var res = await http.get('/api/encyclopedia/collectList');
    return (res.data['data'] as List).map((e) => collectionListModel.fromJson(e)).toList();
  }
  /// 资讯轮播图
  static Future<List<BannerNewModel>> getBanner() async {
    var res = await http.get('/api/home/journalismBanner');
    return (res.data['data'] as List).map((e) => BannerNewModel.fromJson(e)).toList();
  }
  /// 资讯列表（首页）
  static Future<List<NewsListModel>> getNewsList() async {
    var res = await http.get('/api/journalism/index');
    return (res.data['data'] as List).map((e) => NewsListModel.fromJson(e)).toList();
  }

  static Future<screenTypeModel> getscreenType() async {
    //   var data = {"id": id};
    var res = await http.get('/api/encyclopedia/screen');
    return screenTypeModel.fromJson(res.data['data']);
  }


  static Future<projectDetailModel> getprojectDetail(id) async {
    //   var data = {"id": id};
    var res = await http.get('/api/encyclopedia/info/${id}');
    return projectDetailModel.fromJson(res.data['data']);
  }
  /// 取消收藏
  static Future cancelCollect(id) async {
    var response =
    await http.get("/api/encyclopedia/cancelCollect/${id}");
    return response.data;
  }
  /// 收藏
  static Future collect(id) async {
    var response =
    await http.get("/api/encyclopedia/collect/${id}");
    return response.data;
  }

}
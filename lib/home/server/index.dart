import 'package:flutter_tianji/core/network/http.dart';
import 'package:flutter_tianji/home/model/banner_model.dart';

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
}

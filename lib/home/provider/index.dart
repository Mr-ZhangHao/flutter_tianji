import 'package:flutter_tianji/home/model/banner_model.dart';
import 'package:flutter_tianji/home/model/notice_model.dart';
import 'package:flutter_tianji/home/model/rankingModel.dart';
import 'package:flutter_tianji/home/server/index.dart';
import 'package:flutter_tianji/providers/view_state_model.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';

class HomeProvider extends ViewStateModel {
  List<BannerModel> banner;
  getBanner() async {
    setBusy();
    try {
      List<BannerModel> data = await HomeServer.getBanner();
      banner = data;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }



  List<rankingModel> ranking;

  getranking() async {
    setBusy();
    try {
      var data = await HomeServer.getranking();
      ranking = data;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  List<NoticesModel> notices = [];
  getNotices() async {
    setBusy();
    try {
      var res = await HomeServer.getNotices();
      // print(res);
      setIdle();
      notices =
          (res['data'] as List).map((e) => NoticesModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  List<strategyListModel> recommendList = [];
  getRecommendApi() async {
    setBusy();
    try {
      var res = await HomeServer.getRecommendApi();
      // print(res);
      setIdle();
      recommendList = (res['data'] as List)
          .map((e) => strategyListModel.fromJson(e))
          .toList();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }
}

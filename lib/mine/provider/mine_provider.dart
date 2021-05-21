/*
* @message: 我的
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-15 16:35:01
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 16:14:42
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/provider/mine_provider.dart
*/

import 'package:flutter_tianji/baike/model/NewsListModel.dart';
import 'package:flutter_tianji/baike/model/projectListModel.dart';
import 'package:flutter_tianji/home/server/index.dart';
import 'package:flutter_tianji/mine/model/BuddyListModel.dart';
import 'package:flutter_tianji/mine/server/index.dart';
import 'package:flutter_tianji/mine/model/kyc_info_model.dart';
import 'package:flutter_tianji/mine/model/user_model.dart';
import 'package:flutter_tianji/providers/view_state_model.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';

class VertifyFiled {
  String country;
  String lastName;
  String firstName;
  String idType;
  String idNumber;
  VertifyFiled(
      this.country, this.lastName, this.firstName, this.idType, this.idNumber);
}

class MineProvider extends ViewStateModel {
  UserInfoModel userInfo;
  List<BuddyListModel> buddyListModel;
  bool isShowBadge = false;

  KycInfoModel kycInfo;
  String googleSecret = '';
  VertifyFiled vertifyFiled = VertifyFiled('', '', '', '', '');

  Future<UserInfoModel> getUserInfo() async {
    setBusy();
    try {
      UserInfoModel user = await MineServer.getUserInfo();
      setUserInfo(user);
      setIdle();
      return userInfo;
    } catch (e, s) {
      setError(e, s);
      return userInfo;
    }
  }

  Future<List<BuddyListModel>> getBuddyList() async {
    setBusy();
    try {
      var datas = await MineServer.getBuddyList();
      buddyListModel = datas;
      setIdle();
      notifyListeners();
      return buddyListModel;
    } catch (e, s) {
      setError(e, s);
      return buddyListModel;
    }
  }

  void setUserInfo(UserInfoModel params) {
    userInfo = params;
    notifyListeners();
  }

  void getKycInfo() async {
    setBusy();
    try {
      KycInfoModel data = await MineServer.getKycInfo();
      kycInfo = data;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getSecret() async {
    setBusy();
    try {
      var res = await MineServer.googleSecret();
      setGoogleSecret(res['data']['secret']);
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  setIsShowBadge(bool param) {
    isShowBadge = param;
    notifyListeners();
  }

  void setGoogleSecret(String params) {
    googleSecret = params;
    notifyListeners();
  }

  setVertifyFiled(VertifyFiled data) {
    vertifyFiled = data;
    notifyListeners();
  }
  //策略推荐

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


  //项目推荐
  List<projectListModel> projectList = [];
  getProjectRecommendApi() async {
    setBusy();
    try {
      var res = await HomeServer.getProjectRecommend();
      // print(res);
      setIdle();
      projectList = (res['data'] as List)
          .map((e) => projectListModel.fromJson(e))
          .toList();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  //news推荐
  List<NewsListModel> newsList = [];
  getNewsRecommend() async {
    setBusy();
    try {
      var res = await HomeServer.getNewsRecommend();
      // print(res);
      setIdle();
      newsList = (res['data'] as List)
          .map((e) => NewsListModel.fromJson(e))
          .toList();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }


}

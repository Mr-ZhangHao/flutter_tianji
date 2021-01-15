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

import 'package:flutter_tianji/core/services/mine.dart';
import 'package:flutter_tianji/mine/model/kyc_info_model.dart';
import 'package:flutter_tianji/mine/model/user_model.dart';
import 'package:flutter_tianji/providers/view_state_model.dart';

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

  void setGoogleSecret(String params) {
    googleSecret = params;
    notifyListeners();
  }

  setVertifyFiled(VertifyFiled data) {
    vertifyFiled = data;
    notifyListeners();
  }
}

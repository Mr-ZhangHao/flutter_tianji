/*
* @message: 个人中心接口
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-06 22:17:55
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 16:14:52
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/core/services/mine.dart
*/
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter_tianji/core/network/http.dart';
import 'package:flutter_tianji/mine/model/kyc_info_model.dart';
import 'package:flutter_tianji/mine/model/login_history_model.dart';
import 'package:flutter_tianji/mine/model/user_model.dart';

class MineServer {
  ///获取用户信息
  // static Future<UserModel> userInfo() async {
  //   var res = await http.get('/rest/user/info');
  //   return UserModel.fromJson(res.data['data']);
  // }
  static Future<UserInfoModel> getUserInfo() async {
    var res = await http.get('/api/auth/info');
    return UserInfoModel.fromJson(res.data['data']);
  }

  static Future editLoginPsw(psw, newPsw, emailCode, smsCode, googleCode) async {
    var data = {
      "login_password": psw,
      "new_login_password": newPsw,
      "email_code": emailCode ?? '',
      "sms_code": smsCode ?? '',
      "google_code": googleCode ?? ''
    };
    var res = await http.post('/api/auth/login_password/update', data: data);
    return res.data;
  }

  static Future bindEmail(email, emailCode, smsCode, googleCode) async {
    var data = {
      "email": email,
      "email_code": emailCode ?? '',
      "sms_code": smsCode ?? '',
      "google_code": googleCode ?? ''
    };
    var res = await http.post('/api/auth/email', data: data);
    return res.data;
  }

  static Future bindMobile(area, mobile, emailCode, smsCode, googleCode) async {
    var data = {
      "area": area,
      "mobile": mobile,
      "email_code": emailCode ?? '',
      "sms_code": smsCode ?? '',
      "google_code": googleCode ?? ''
    };
    var res = await http.post('/api/auth/mobile', data: data);
    return res.data;
  }




  static Future setPayPsw(psw, emailCode, smsCode, googleCode) async {
    var data = {"pay_password": psw, "email_code": emailCode, "sms_code": smsCode, "google_code": googleCode};
    var res = await http.post('/api/auth/pay_password/set', data: data);
    return res.data;
  }

  static Future googleSecret() async {
    var res = await http.get('/api/auth/google');
    return res.data;
  }

/*
  static Future<PaymentModel> getPayMent() async {
    var res = await http.get('/api/c2c/account/paymentList');
    return PaymentModel.fromJson(res.data['data']);
  }
*/

  static Future bindGoogle(secret, emailCode, smsCode, googleCode) async {
    var data = {
      "google_secret": secret,
      "email_code": emailCode ?? '',
      "sms_code": smsCode ?? '',
      "google_code": googleCode ?? ''
    };
    var res = await http.post('/api/auth/google', data: data);
    return res.data;
  }

  static Future<List<LoginHistoryModel>> getLogiHistory(page) async {
    var res = await http.get('/api/auth/login_log', queryParameters: {"page": page, "pre_page": 10});
    return (res.data['data'] as List).map((e) => LoginHistoryModel.fromJson(e)).toList();
  }

  static Future<KycInfoModel> getKycInfo() async {
    var res = await http.get('/api/auth/kyc_info');
    return KycInfoModel.fromJson(res.data['data']);
  }
  static Future upFile(formData) async {
    Options options = Options(contentType: 'multipart/form-data');
    var response =
        await http.post('/file/upFile', options: options, data: formData);
    return response;
  }
  static Future vertifySubmit(Map data) async {
    var res = await http.post('/api/auth/kyc', data: data);
    return res.data;
  }

  static Future getRate(page) async {
    var res = await http.get('/api/common/fee');
    return res.data;
  }
  static upLoadImage(File image) async {
    String filePath = image.path;
    var name =
        filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(filePath, filename: name)});
    try {
      var response = await MineServer.upFile(formData);
      return response;
    } catch (e) {
      print(e);
    }
  }
}

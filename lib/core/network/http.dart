/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-29 16:32:43
* @LastEditors: Jack
* @LastEditTime: 2020-08-11 17:49:08
* @Deprecated: 否
* @FilePath: /ETF/lib/core/network/http.dart
*/
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/core/network/logger.dart';
import 'package:flutter_tianji/utils/sp_utils.dart';
import 'api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    // options.baseUrl = GlobalConfig.currentApiHostUrl;
//    options.baseUrl = 'http://192.168.3.17:8091';
    options.baseUrl = 'http://159.138.107.243:8888';
//    options.baseUrl = 'http://slapi.huanxiongchat.com';
    // interceptors
    //   ..add(ApiInterceptor())
    //   ..add(LogInterceptor(responseBody: true));
    interceptors..add(ApiInterceptor())..add(DioLogger());
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override // 请求拦截
  onRequest(RequestOptions options) async {
    String token = await SpUtils.getToken() ?? '';
    String sessionId = await SpUtils.getSessionId() ?? '';
    if (token != null) {
      options.headers['token'] = token;
      options.headers['sessionId'] = sessionId;
    }
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}' +
        ' data: ${options.data}');
    debugPrint('---api-request--->data--->${options.data}');
    return options;
  }

  @override // 响应拦截
  onResponse(Response response) {
    debugPrint('---api-response--->resp----->${json.encode(response.data)}');

    /// 网络层面的状态
    if (response.statusCode == 200) {
      Toast.close();
      // 对象类数据
      ResponseData respData = ResponseData.fromJson(response.data);
      if (respData.success) {
        return http.resolve(response);
      } else {
        // 未登陆需要重新登录
        if (response.data['code'] == 9002) {
          /// 登录失败
          Toast.close();
          Toast.showText(response.data['msg']);
          // SpUtils.sp.clear();
          // navigatorKey.currentState.pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (_) => LoginScreen()),
          //     (route) => route == null);
        } else {
          // 接口错误处理
          Toast.close();
          // 以免后端返回的msg为null 保险起见这里做下处理
          Toast.showText(response.data['msg']);
        }
        throw NotSuccessException.fromRespData(respData);
      }
    } else {
      Toast.close();
      Toast.showText('请检查网络状态');
      throw Exception();
    }
  }
}

/// 响应数据类
class ResponseData extends BaseResponseData {
  bool get success => code == 200;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] ?? null;
  }
}

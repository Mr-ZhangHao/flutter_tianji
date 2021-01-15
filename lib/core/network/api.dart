/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-07-30 20:04:13
* @LastEditors: Roy
* @LastEditTime: 2020-08-06 11:19:01
* @Deprecated: 否
* @FilePath: /ETF/lib/core/network/api.dart
*/
/*
* @message: API顶层封装
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-09 01:14:56
* @LastEditors: Jack
* @LastEditTime: 2020-06-16 23:05:59
* @Deprecated: 否
* @FilePath: /flutter_qinyun/lib/core/network/api.dart
*/
import 'dart:convert';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

export 'package:dio/dio.dart';

// 必须是顶层函数!
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    /// 初始化 加入app通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors..add(HeaderInterceptor());
    init();
  }
  void init();
}

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.connectTimeout = 1000 * 30;
    options.receiveTimeout = 1000 * 30;
    // options.headers['content-type'] = 'application/json;charset=UTF-8';
    return options;
  }
}

/// 子类需要重写
abstract class BaseResponseData {
  int code = 200;
  String msg;
  dynamic data;

  bool get success;

  BaseResponseData({this.code, this.msg, this.data});

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $msg, data: $data}';
  }
}

/// 接口的code没有返回为true的异常  ==== data
class NotSuccessException implements Exception {
  String message;

  NotSuccessException.fromRespData(BaseResponseData respData) {
    message = respData.msg;
  }
}

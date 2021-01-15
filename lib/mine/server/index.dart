
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_tianji/core/network/http.dart';
import 'package:flutter_tianji/mine/server/url.dart';

class UserServer {
  // static String _token = SpUtils.sp.getString('token');
  // static Future<String, dynamic> login() async {
  //   return
  // }

  // 发送验证码
  static Future senCode(
      String userName, String captchaKey, String captcha, String type) async {
    var response = await http.post(UserApi.sendCode, data: {
      "mobile": userName.toString(),
      "type": type.toString(),
      "captcha_key": captchaKey.toString(),
      "captcha": captcha
    });
    return response.data;
  }

  // 获取图片
  static Future getCaptcha() async {
    var response = await http.get(UserApi.captcha);
    return response.data;
  }

  // 注册
  static Future register(
      String userName, String code, String password, String inviteCode) async {
    var response = await http.post(UserApi.reg, data: {
      "mobile": userName, //账号
      "code": code, //验证码
      "password": password, //密码
      "pid": inviteCode // 邀请码(必填)
    });
    return response.data;
  }

  // 登录
  static Future login(String userName, String password) async {
    var response = await http.post(UserApi.login, data: {
      "username": userName, //账号
      "password": password, //密码
    });
    return response.data;
  }

  // 退出登录
  static Future logOut() async {
    var response = await http.post(UserApi.logout);
    return response;
  }

  // 忘记密码
  static Future resetPsw(mobile, code, psw, resetPWD) async {
    var response = await http.post(UserApi.resetPsw, data: {
      "mobile": mobile,
      "code": code,
      "password": psw,
      "password_confirmation": resetPWD
    });
    return response;
  }

  /// 获取本地国家/地区编码文件数据
  static Future<String> _loadClassInfoJson() async {
    return await rootBundle.loadString('data/sms_area.json');
  }

  /// 获取Android设备信息
  static Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  /// 获取IOS设备信息
  static Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}

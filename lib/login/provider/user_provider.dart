/*
* @message: 用户模块
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-15 12:09:20
* @LastEditors: Jack
* @LastEditTime: 2020-08-10 12:23:09
* @Deprecated: 否
* @FilePath: /ETF/lib/pages/login/provider/user_provider.dart
*/

// import 'package:royal_garden/core/services/user.dart';
import 'package:flutter_tianji/providers/view_state_model.dart';
import 'package:flutter_tianji/utils/sp_utils.dart';

class UserProvider extends ViewStateModel {
  String token = SpUtils.sp.getString('token');
  bool _isLogin = SpUtils.sp.getString('token') != null;
  // UserInfoModel _userInfo;
  // CaptchaModel captchaModel;

  bool get isLogin => _isLogin;
  // UserInfoModel get userInfo => _userInfo;

  void setIsLogin(isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  // void setUserInfo(UserInfoModel params) {
  //   _userInfo = params;
  //   notifyListeners();
  // }
  void getCaptcha() async {
    setBusy();
    try {
      // var response = await UserServer.getCaptcha();
      // captchaModel = CaptchaModel.fromJson(response['data']);
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

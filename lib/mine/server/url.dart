/*
* @message: 用户模块Api路由
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-14 16:56:12
* @LastEditors: Roy
* @LastEditTime: 2020-05-29 14:59:51
* @Deprecated: 否
* @FilePath: /KEMX_Flutter/lib/pages/user/server/url.dart
*/
class UserApi {
  /// 登录
  static String login = '/api/auth/login';

  /// 注册
  static String reg = '/api/auth/register';

  //图形验证码
  static String captcha = '/api/service/captcha';

  /// 发送验证码
  static String sendCode = '/api/service/sendMessage';

  /// 退出登录
  static String logout = '/user/logout';

  /// 忘记密码
  static String resetPsw = '/api/auth/updatePassword';

  /// 用户信息
  static String userInfo = '/user/info';
}

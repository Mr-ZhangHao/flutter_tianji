/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-06-15 23:05:37
* @LastEditors: Roy
* @LastEditTime: 2020-08-07 19:18:34
* @Deprecated: 否
* @FilePath: /ETF/lib/config/global_config.dart
*/

/*
 *系统主题设置，包括系统默认字体 背景色等
 */
import 'package:dio/dio.dart';
import 'package:flutter_tianji/common/toast/index.dart';

class GlobalConfig {
  ///当前版本号和版本名称，由于ios打tf包只能用1.0版本，所以升级判断要用自己的配置文件
  static int andVersionCode = 100;
  static String andVersionName = '1.0.0';
  static int iosVersionCode = 100;
  static String iosVersionName = '1.0.0';

  ///当前版本号和版本名称，由于ios打tf包只能用1.0版本，所以升级判断要用自己的配置文件
  static int versionCode = 100;
  static String versionName = '1.0.0';

  //aes加密得key
  static String aesKey = 'GmtWrMXg6ruVzJ1oCRQY9g==';
  //aes加密得CBC模式下的vi
  static String cbcViKey = '92o3jrnf83ikgud7';

  /// true 时打的是测试包  改为正式包要修改 包名 xml provider名称 应用名
  static bool isDebug = false; //是否是调试模式

  //api服务器地址
  static String apiHost1 = "http://39.101.163.191/";
  static String apiHost2 = "http://www.aaladfk.cn/";
  static String apiHost3 = "http://three.aaladfk.cn:9000/";
  static String apiHost4 = "http://four.aaladfk.cn:9000/";

  static String uploadHost = "http://39.101.161.229:8088";
  static String imgHost = "http://qc7u9r5co.bkt.clouddn.com/";
  static String webSocketUrl = "ws://192.168.3.17:8091/websocket";
  static String sendMsgUrl = "http://39.101.185.26:8089/send/message";

  static int currentApiHostIndex = 0;
  static String get currentApiHostUrl {
    switch (currentApiHostIndex) {
      case 0:
        return apiHost1;
      case 1:
        return apiHost2;
      case 2:
        return apiHost3;
      case 3:
        return apiHost4;
      default:
        return apiHost2;
    }
  }

  // 操作型的错误提示
  static errorTips(e) async {
    Toast.close();
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.SEND_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      Toast.showError('请检查网络');
    }
  }
}

const APP_ID = 'dd75ce1243be4603b15223da26df01b3';

///分隔线颜色
const dividerColor = 0xffF2F2F2;
const  font_sp10 = 10;
const  font_sp12 = 12;
const  font_sp14 = 14;
const  font_sp16 = 16;
const  font_sp18 = 18;

const DefaultPadding = 60.0;
const circular = 44.0;
const  gap_px5 = 5;
const  gap_px10= 10;
const  gap_px15 = 15;
const  gap_px20 = 20;
const  gap_px25 = 25;
const  gap_px30 = 30;
const  gap_px35 = 35;
const  gap_px40 = 40;
const  gap_px45 = 45;
const  gap_px50 = 50;

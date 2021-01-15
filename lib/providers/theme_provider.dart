/*
* @message: 主题设置
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-03-24 10:08:10
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 11:37:33
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/providers/theme_provider.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/theme/dark.dart';
import 'package:flutter_tianji/common/theme/light.dart';
import 'package:flutter_tianji/utils/sp_utils.dart';

class ThemeProvider with ChangeNotifier {
  /// 用户选择的明暗模式
  bool _userDarkMode;

  bool get userDarkMode => _userDarkMode;
  ThemeProvider() {
    /// 用户选择的明暗模式
    _userDarkMode = SpUtils.sp.getBool('userDarkMode') ?? false;
  }

  /// 指定主题模式
  void switchTheme({bool userDarkMode}) {
    _userDarkMode = userDarkMode ?? _userDarkMode;
    notifyListeners();
    saveTheme2Storage(_userDarkMode);
  }

  /// 根据主题 明暗 生成对应的主题
  /// [dark]系统的Dark Mode
  themeData({bool platformDarkMode: false}) {
    // var isDark = platformDarkMode || _userDarkMode; // 解开
    // Brightness brightness = isDark ? Brightness.dark : Brightness.light; // 解开
    Brightness brightness = Brightness.light;
    if (brightness == Brightness.dark) {
      // 设置初始默认主题的 (深色)
      return ThemeData(
        primaryColor: Color(0xff212537), // 深色默认颜色
        scaffoldBackgroundColor: Color(0xff171A2F), // 深色背景颜色
        brightness: Brightness.dark,
        appBarTheme: darkAppBarTheme(),
        textTheme: darkTextTheme(),
        cardTheme: darkCardTheme(),
        bottomAppBarTheme: darkBottomAppBarTheme(),
        tabBarTheme: TabBarTheme(
          labelColor: kPrimaryColor,
          unselectedLabelColor: Color(0xffCFCFCF),
        ),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Color(0xff171A2F)),
        dialogBackgroundColor: Color(0xff212537),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2B2F41)),
          ),
        ),
        buttonTheme: ButtonThemeData(buttonColor: Color(0xff313752)),
        dividerColor: Color(0xff2B2F41),
      );
    } else {
      // 亮色(主题)
      return ThemeData(
          primaryColor: kbgColor, // 默认颜色
          backgroundColor: kbgColor,
          scaffoldBackgroundColor: kbgColor, // 默认背景颜色
          primaryColorDark: Colors.white,
          primaryColorLight: Colors.black,
          appBarTheme: lightAppBarTheme(),
          textTheme: lightTextTheme(),
          cardTheme: lightCardTheme(),
          bottomAppBarTheme: lightBottomAppBarTheme(),
          tabBarTheme: TabBarTheme(
            labelColor: kPrimaryColor,
            unselectedLabelColor: Color(0xff666666),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          primaryIconTheme: IconThemeData(color: Colors.white),
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Color(0xffffffff)),
          dialogBackgroundColor: Color(0xffffffff),
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff0f0f0)),
          )),
          buttonTheme: ButtonThemeData(buttonColor: Color(0xffffffff)),
          dividerColor: Color(0xffE5E5E5));
      // themeData = themeData.copyWith(
      //   // backgroundColor: Color(0xffF8F8FA),
      //   brightness: brightness,
      //   cupertinoOverrideTheme: CupertinoThemeData(
      //     brightness: brightness,
      //   ),
      //   cardTheme: CardTheme(color: Color(0xff212537), elevation: 10),
      //   appBarTheme: themeData.appBarTheme.copyWith(elevation: 0),
      //   hintColor: themeData.hintColor.withAlpha(90),
      //   errorColor: Colors.red,
      //   chipTheme: themeData.chipTheme.copyWith(
      //     pressElevation: 0,
      //     padding: EdgeInsets.symmetric(horizontal: 10),
      //     labelStyle: themeData.textTheme.caption,
      //     backgroundColor: themeData.chipTheme.backgroundColor.withOpacity(0.1),
      //   ),
      // );
    }
  }

  /// 数据持久化到shared preferences
  saveTheme2Storage(bool userDarkMode) async {
    await SpUtils.sp.setBool('userDarkMode', userDarkMode);
  }
}

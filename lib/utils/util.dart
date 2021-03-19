/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-21 22:28:00
* @LastEditors: Roy
* @LastEditTime: 2020-05-30 15:15:24
* @Deprecated: 否
* @FilePath: /KEMX_Flutter/lib/config/util.dart
*/
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  // 去掉小数末尾的0
  static cutZero(old) {
    // 拷贝一份 返回去掉零的新串
    old = old.toString();
    // var newstr = old;
    // 循环变量 小数部分长度
    bool isDouble = old.contains('.');
    if (isDouble) {
      String str = old.split('.')[1];
      if (str.length >= 8) {
        String strs = str.substring(0, 2);
        if (strs.startsWith('00')) {
          return old.split('.')[0].toString();
        } else {
          return old.split('.')[0] + '.' + strs;
        }
      } else {
        if (old.split('.')[1].toString() == '0') {
          return old.toString().split('.')[0];
        } else {
          return old.toString();
        }
      }
    } else {
      return old.toString();
    }
  }

  static Future<String> createFileFromString(String base64Str) async {
    Uint8List bytes = base64.decode(base64Str);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  static conversionNum(num) {
    if (num >= 1000 && num < 1000000) {
      return formatNum(num / 1000, pos: 2).toString() + 'K';
    } else if (num >= 1000000 && num < 1000000000) {
      return formatNum(num / 1000000, pos: 2).toString() + 'M';
    } else if (num >= 1000000000 && num < 1000000000000) {
      return formatNum(num / 1000000000, pos: 2).toString() + 'G';
    } else if (num < 1000) {
      return num;
    }
  }

  //保留几位小数
  static formatNum(var num, {int pos = 8}) {
    return NumUtil.getNumByValueStr(num.toString(), fractionDigits: pos)
        .toString();

    /*if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      //小数点后有几位小数
      return cutZero(num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      return cutZero(num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }*/
  }

  ///手机号验证
  static bool isChinaPhone(String str) {
    return RegExp(
            r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
        .hasMatch(str);
  }

  ///邮箱验证
  static bool isEmail(String str) {
    return RegExp(r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$")
        .hasMatch(str);
  }

  ///验证URL
  static bool isUrl(String value) {
    return RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+").hasMatch(value);
  }

  ///验证身份证
  static bool isIdCard(String value) {
    return RegExp(r"\d{17}[\d|x]|\d{15}").hasMatch(value);
  }

  ///验证中文
  static bool isChinese(String value) {
    return RegExp(r"[\u4e00-\u9fa5]").hasMatch(value);
  }

  static String hiddenMiddle(dynamic value, int index, int number) {
    if (value == null) return '--';
    String newValue = value.toString();
    return newValue.replaceFirst(
        new RegExp(r"\S{" + "$number" + "}"), '*' * number, index);
  }

  static formatNumber(num, int postion) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      //小数点后有几位小数
      return num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString();
    } else {
      return num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString();
    }
  }

  static normalText(String text,
      {double fontSize,
      Color color,
      TextAlign textAlign,
      FontWeight fontWeight}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: sp(fontSize == null ? 28 : fontSize),
          color: color == null ? Color(0xff323232) : color,
          fontWeight: fontWeight != null ? fontWeight : FontWeight.normal),
      textAlign: textAlign == null ? TextAlign.left : textAlign,
    );
  }

  ///get通用状态栏
  static AppBar getCommonAppBar(BuildContext context, String title,
      {double fontSize, List<Widget> actions, elevation}) {
    if (title == null) {
      title = "";
    }
    return AppBar(
      bottom: null,
      elevation: elevation,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset('images/login/back.png',
              width: width(22), height: height(36)),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: kTextColor3,
          fontSize: fontSize == null ? sp(32) : sp(fontSize),
        ),
      ),
      //标题栏居中
      centerTitle: true,
      //右边的action 按钮
      actions: actions == null ? <Widget>[] : actions,

      //action 颜色
      //actionsIconTheme: IconThemeData(color: Colors.white),
    );
  }

  static ShowDialogUtils(BuildContext context, contText,
      {Function confirm,
      TextEditingController textcontroller,
      bool isvisible}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(contText,
                style: TextStyle(fontSize: sp(32), color: Color(0xff323232))),
            content: Visibility(
              child: TextField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(15) //限制长度
                ],
                style: TextStyle(color: Color(0xff323232)),
                controller: textcontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(width(8))),

                    ///用来配置边框的样式
                    borderSide: BorderSide(
                      ///设置边框的颜色
                      color: Color(0xffDADADA),

                      ///设置边框的粗细
                      width: 2.0,
                    ),
                  ),

                  ///设置输入框可编辑时的边框样式
                  enabledBorder: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(width(8))),

                    ///用来配置边框的样式
                    borderSide: BorderSide(
                      ///设置边框的颜色
                      color: Color(0xffDADADA),

                      ///设置边框的粗细
                      width: 2.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(width(8))),

                    ///用来配置边框的样式
                    borderSide: BorderSide(
                      ///设置边框的颜色
                      color: Color(0xffDADADA),

                      ///设置边框的粗细
                      width: 2.0,
                    ),
                  ),

                  ///用来配置输入框获取焦点时的颜色
                  focusedBorder: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(width(8))),

                    ///用来配置边框的样式
                    borderSide: BorderSide(
                      ///设置边框的颜色
                      color: Color(0xffDADADA),

                      ///设置边框的粗细
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                ),
                autofocus: false,
              ),
              visible: isvisible == null ? false : isvisible,
            ),
            actions: <Widget>[
              FlatButton(
                child: Container(
                  width: width(220),
                  height: height(80),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffDADADA),
                    borderRadius: BorderRadius.all(Radius.circular(width(8))),
                  ),
                  child: Text(Tr.of(context).cancel,
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xff323232))),
                ),
                onPressed: () => RouterUtil.goBack(context),
              ),
              FlatButton(
                  child: Container(
                    width: width(220),
                    height: height(80),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff7865FE),
                      borderRadius: BorderRadius.all(Radius.circular(width(8))),
                    ),
                    child: Text(Tr.of(context).determine,
                        style:
                            TextStyle(fontSize: sp(28), color: Colors.white)),
                  ),
                  onPressed: confirm),
            ],
          );
        });
  }
}

class WhitelistingTextInputFormatter {}

class commonTypeWidget extends StatelessWidget {
  final Function(int type, String name) onTab;
  final List typeList;
  const commonTypeWidget({Key key, this.onTab, this.typeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: 400,
      ),
      height: height(400),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {onTab(e['id'], e['name'])},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(e['name']),
                          height: height(100),
                          alignment: Alignment.center,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel,
                  style: TextStyle(color: Colors.blue)),
              height: height(100),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

/* 
  平台 类型
   */
class platformTypeWidget extends StatelessWidget {
  final Function(int type, String name) onTab;
  final List typeList;
  const platformTypeWidget({Key key, this.onTab, this.typeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: 400,
      ),
      height: height(400),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {onTab(e['id'], e['platform'])},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(e['platform']),
                          height: height(100),
                          alignment: Alignment.center,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel,
                  style: TextStyle(color: Colors.blue)),
              height: height(100),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

/* 
  币种 类型
   */
class coinsTypeWidget extends StatelessWidget {
  final Function(int type, String name) onTab;
  final List typeList;
  const coinsTypeWidget({Key key, this.onTab, this.typeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: 400,
      ),
      height: height(400),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {onTab(e['id'], e['coin'])},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(e['coin']),
                          height: height(100),
                          alignment: Alignment.center,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel,
                  style: TextStyle(color: Colors.blue)),
              height: height(100),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

class StrategyTypeWidget extends StatelessWidget {
  final Function(int type, String name) onTab;
  final List typeList;
  const StrategyTypeWidget({Key key, this.onTab, this.typeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: 400,
      ),
      height: height(400),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {onTab(e['id'], e['type_name'])},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(e['type_name']),
                          height: height(100),
                          alignment: Alignment.center,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel,
                  style: TextStyle(color: Colors.blue)),
              height: height(100),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

class AccountTypeWidget extends StatelessWidget {
  final Function(int id, String name, String avatar, String memo) onTab;
  final List typeList;
  const AccountTypeWidget({Key key, this.onTab, this.typeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: 400,
      ),
      height: height(400),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {
                          onTab(e['id'], e['username'], e['avatar'], e['memo'])
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(e['memo']),
                          height: height(100),
                          alignment: Alignment.center,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel,
                  style: TextStyle(color: Colors.blue)),
              height: height(100),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

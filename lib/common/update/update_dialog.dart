import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class UpDateVersionDialog extends StatefulWidget {
  final int type; // 升级类型 1－用户选择是否升级，2－强制用户升级
  final String codeName;
  final String content;
  final String androidUrl;
  final String iosUrl;
  const UpDateVersionDialog({
    Key key,
    this.type,
    this.codeName,
    this.content,
    this.androidUrl,
    this.iosUrl,
  }) : super(key: key);

  @override
  _UpDateVersionDialogState createState() => _UpDateVersionDialogState();
}

class _UpDateVersionDialogState extends State<UpDateVersionDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kTransprant,
      borderRadius: BorderRadius.circular(12),
      animationDuration: Duration(milliseconds: 300),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: width(560),
            height: height(600),
            margin: EdgeInsets.only(top: height(30)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('images/mine/update-head.png',
                          width: width(560),
                          height: width(150),
                          fit: BoxFit.fill),
          /*
                      Image.asset('images/mine/update-head.png',
                          width: width(560),
                          height: width(150),
                          fit: BoxFit.fill),*/
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width(40)),
                        alignment: Alignment.centerLeft,
                        child: Text(widget.codeName ?? "新版本更新",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: sp(32),
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: height(40)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width(40)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //  Text('1.全新会员体系上线；', style: TextStyle(color: Color(0xff323232), fontSize: sp(28))),
                            Text(widget.content ?? '部分Bug修复',
                                style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: sp(28))),
                            //  Text('3.新增更多币种的充值；', style: TextStyle(color: Color(0xff323232), fontSize: sp(28))),
                            //  Text('4.支持越南语。', style: TextStyle(color: Color(0xff323232), fontSize: sp(28))),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Stack(
                  children: [
                      Positioned(child:     Image.asset('images/mine/update-head2.png',
                          width: width(124),
                          height: width(84),
                          fit: BoxFit.fill),right: 0,bottom: 0,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width(40),vertical: height(40)),
                      child:        Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: width(250),
                                alignment: Alignment.center,
                                height: width(80),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width(8)),
                                    border: Border.all(
                                        width: 1, color: Color(0xffd8d8d8)
                                    )),
                                child: Text('下次再说',
                                    style: TextStyle(
                                        fontSize: sp(28), color: Color(0xff838383))),
                              ),
                            ),
                          ),
                          SizedBox(width: width(80),),
                          Expanded(
                            child: InkWell(
                              onTap: _confirm,
                              child: Container(

                                width: width(250),
                                alignment: Alignment.center,
                                height: width(80),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width(8)),
                                    border: Border.all(
                                        width: 1, color: kPrimaryColor)),
                                child: Text('立即更新',
                                    style: TextStyle(
                                        fontSize: sp(28),
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ],
                      ),),
                  ],
                )
              ],
            ),
          ),
          _buildTitle(),
        ],
      ),
    );
  }

  _confirm() {
    ///是安卓，直接下载
    if (Platform.isAndroid) {
      setState(() {
        // isDownLoading = true;
        _openBrower('${widget?.androidUrl}');
        // _downloadApk('${widget?.androidUrl}');
      });
    } else if (Platform.isIOS) {
      ///ios，跳转下载页
      _openBrower('${widget?.iosUrl}');
    }
  }

  // _downloadApk(String androidUrl) {}

  _openBrower(String isIOS) async {
    if (await canLaunch(isIOS)) {
      await launch(isIOS);
    } else {
      throw 'Could not launch $isIOS';
    }
  }

  Image _buildTitle() {
    return Image.asset('images/mine/rock.png',
        height: width(105), fit: BoxFit.fill);
  }
}

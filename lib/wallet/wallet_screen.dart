/*
* @message: 我的资产
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-22 11:27:56
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/wallet/wallet_screen.dart
*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:flutter_tianji/wallet/routes/index.dart';
import 'package:flutter_tianji/wallet/views/wallet_list.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  bool isFlag = false;

  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WallerProvider model1 = Provider.of<WallerProvider>(context, listen: false);

    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 10), (timer) {
        model1.getBibiAsset();
        model1.getCoinList();
      });
    } else {
      model1.getBibiAsset();
      model1.getCoinList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: Color(0XFFF9F8FA),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: width(20)),
            child: Consumer<WallerProvider>(
              builder:
                  (BuildContext context, WallerProvider model1, Widget child) {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: statusBarHeight + 20,
                    ),
                    Container(
                      child: Container(
                        alignment: Alignment.center,
                        height: height(320),
                        width: width(690),
                        padding: EdgeInsets.symmetric(
                            vertical: height(40), horizontal: width(40)),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/wallet/Mask@2x.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: width(36),
                                        width: width(36),
                                        child: Image.asset(
                                            'images/wallet/hb@2x.png',
                                            fit: BoxFit.contain,
                                            width: width(36),
                                            height: height(36)),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: width(8)),
                                        child: Text('总资产估值（USDT）：',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: sp(32),
                                                height: 1.1)),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: height(28),
                                    width: width(48),
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        model1.setIsOpen(!model1.isOpen);
                                      },
                                      child: Image.asset(
                                          model1.isOpen
                                              ? 'images/wallet/see.png'
                                              : 'images/wallet/hide2.png',
                                          fit: BoxFit.contain,
                                          width: width(48),
                                          height: height(28)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  0, height(6), 0, height(0)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  model1.isOpen
                                      ? Utils.cutZero(
                                              model1.assetPreview?.total ??
                                                  0) ??
                                          '--.--'
                                      : '****',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: sp(64),
                                      height: 1.1)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, height(22)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  model1.isOpen
                                      ? '≈' +
                                              Utils.cutZero(model1
                                                      .assetPreview?.totalCny ??
                                                  0) +
                                              '￥' ??
                                          '--.--'
                                      : '****',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: sp(24),
                                      height: 1.1)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => RouterUtil.push(context,
                                      "${WalletRouter.recharge}?coinName=USDT"),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: width(150),
                                        height: height(64),
                                        margin:
                                            EdgeInsets.only(right: width(20)),
                                        decoration: BoxDecoration(
                                            border: new Border.all(
                                                color: Color(0xFFFFFFFF),
                                                width: width(2)),
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    width(8))),
                                        alignment: Alignment.center,
                                        child: Text('充币',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 12,
                                            )),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                    child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => RouterUtil.push(context,
                                      "${WalletRouter.withdrawDetail}?coinName=USDT"),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: width(150),
                                        height: height(64),
                                        margin:
                                            EdgeInsets.only(right: width(20)),
                                        decoration: BoxDecoration(
                                            border: new Border.all(
                                                color: Color(0xFFFFFFFF),
                                                width: width(2)),
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    width(8))),
                                        alignment: Alignment.center,
                                        child: Text('提币',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 12,
                                            )),
                                      ),
                                    ],
                                  ),
                                )),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => RouterUtil.push(
                                      context, WalletRouter.recordBibi),
                                  child: Text('财务记录',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: sp(28),
                                          height: 1.1)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: walletListView(
                          wallerProvider: model1,
                        ),
                      ),
                    )
                  ],
                );
              },
            )));
  }
}

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
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/home/widgets/home_widget/marked_list.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/wallet/routes/index.dart';
import 'package:flutter_tianji/wallet/views/wallet_list.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  bool isFlag = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void hide() {
    setState(() {
      isFlag = !isFlag;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: Color(0XFFF9F8FA),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: width(20)),
          child: Column(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: width(36),
                                  width: width(36),
                                  child: Image.asset('images/wallet/hb@2x.png',
                                      fit: BoxFit.contain,
                                      width: width(36),
                                      height: height(36)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: width(8)),
                                  child: Text('币币资产估值（USDT）：',
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
                                onTap: hide,
                                child: Image.asset(
                                    isFlag
                                        ? 'images/wallet/hide2.png'
                                        : 'images/wallet/see.png',
                                    fit: BoxFit.contain,
                                    width: width(48),
                                    height: height(28)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.fromLTRB(0, height(6), 0, height(16)),
                        alignment: Alignment.centerLeft,
                        child: Text(isFlag ? '****' : '0.00000000',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: sp(64),
                                height: 1.1)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, height(32)),
                        alignment: Alignment.centerLeft,
                        child: Text(isFlag ? '****' : '≈0.00',
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
                                  margin: EdgeInsets.only(right: width(20)),
                                  decoration: BoxDecoration(
                                      border: new Border.all(
                                          color: Color(0xFFFFFFFF),
                                          width: width(2)),
                                      borderRadius:
                                          new BorderRadius.circular(width(8))),
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
                                  margin: EdgeInsets.only(right: width(20)),
                                  decoration: BoxDecoration(
                                      border: new Border.all(
                                          color: Color(0xFFFFFFFF),
                                          width: width(2)),
                                      borderRadius:
                                          new BorderRadius.circular(width(8))),
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
                  child: walletListView(),
                ),
              )
            ],
          ),
        ));
  }
}

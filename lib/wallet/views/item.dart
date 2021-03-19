/*
* @message: 登录
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-13 16:52:53
* @Deprecated: 否
* @FilePath: /archimedes/lib/pages/mine/views/account.dart
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/providers/gloable_provider.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/wallet/model/coin_info_model.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:flutter_tianji/wallet/routes/index.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final String coinName;
  ItemPage({Key key, this.coinName}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            child: Image.asset('images/mine/back@2x.png',
                width: width(22), height: height(36)),
          ),
        ),
        brightness: Brightness.light,
        title: Text(widget.coinName,
            style: TextStyle(color: kTextColor3, fontSize: sp(36))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: kLineColor1, width: width(1)))),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: height(220),
              margin: EdgeInsets.only(top: height(26)),
              padding: EdgeInsets.symmetric(horizontal: width(28)),
              child: Consumer<WallerProvider>(
                builder:
                    (BuildContext context, WallerProvider model, Widget child) {
                  return Container(
                    height: height(220),
                    color: Color(0xFFFFFFFF),
                    padding: EdgeInsets.only(left: width(20), right: width(20)),
                    margin: EdgeInsets.only(top: height(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('images/home/icon_quantify.png',
                                    width: width(80), height: height(80)),
                                SizedBox(
                                  width: height(20),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${model.currentCoin.coin.name ?? ""}',
                                        style: TextStyle(
                                            fontSize: sp(32),
                                            color: Color(0xFF604F6A),
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        '${model.isOpen ? model.currentCoin.available ?? "0.00" : "****"}',
                                        style: TextStyle(
                                            fontSize: sp(36),
                                            color: Color(0xFF444444))),
                                  ],
                                )
                              ],
                            )),
                            Text(
                                '≈ ¥${model.isOpen ? model.currentCoin.cny ?? "0.00" : "****"}',
                                style: TextStyle(
                                    fontSize: sp(28),
                                    color: Color(0xffCFCFCF))),
                          ],
                        ),
                        SizedBox(
                          height: height(30),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: kDividerColor))),
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: GestureDetector(
                              child: Text('充币',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: sp(28), color: kPrimaryColor)),
                              onTap: () => RouterUtil.push(context,
                                  "${WalletRouter.recharge}?coinName=${model.currentCoin.coin.name ?? ""}"),
                            )),
                            Container(
                              width: width(1),
                              height: height(30),
                              color: Color(0xffE8E8E8),
                            ),
                            Expanded(
                                child: GestureDetector(
                                    child: Text('提币',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: sp(28),
                                            color: kPrimaryColor)),
                                    onTap: () {
                                      RouterUtil.pushResult(context,
                                          "${WalletRouter.withdrawDetail}?coinName=${model.currentCoin.coin.name ?? ""}",
                                          (result) {
                                        Provider.of<WallerProvider>(context,
                                                listen: false)
                                            .setCurrentCoin(
                                                model.currentCoin.coin ?? "");
                                      });
                                    }))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class IconItemWidget extends StatelessWidget {
  const IconItemWidget({
    Key key,
    this.icon,
    this.title,
    this.onTab,
  }) : super(key: key);

  final String icon;
  final String title;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTab,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: width(52),
            width: width(44),
            child: Image.asset(icon,
                fit: BoxFit.contain, width: width(52), height: height(44)),
          ),
          Container(
            width: width(80),
            margin: EdgeInsets.only(top: height(10)),
            alignment: Alignment.center,
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kTextColor9, fontSize: sp(24), height: 1.42)),
          ),
        ],
      ),
    );
  }
}

class TopItemWidget extends StatelessWidget {
  const TopItemWidget({
    Key key,
    this.title,
    this.number,
    this.align,
  }) : super(key: key);

  final String title;
  final String number;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(title,
              textAlign: TextAlign.left,
              style:
                  TextStyle(color: kTextColor7, fontSize: sp(24), height: 1.1)),
        ),
        Container(
          margin: EdgeInsets.only(top: height(12)),
          alignment: Alignment.centerLeft,
          child: Text(number,
              textAlign: align,
              style: TextStyle(
                  color: kTextColor5,
                  fontSize: sp(32),
                  letterSpacing: -1,
                  height: 1.1,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

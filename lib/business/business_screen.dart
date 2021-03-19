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
import 'package:flutter_tianji/business/routes/index.dart';
import 'package:flutter_tianji/business/views/found.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/CommonItemWidget.dart';
import 'package:flutter_tianji/utils/screen.dart';

// 资产
enum AssetsType {
  // 发现
  found,
  // 归集
  collection
}

class BusinessScreen extends StatefulWidget {
  BusinessScreen({Key key}) : super(key: key);

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen>
    with SingleTickerProviderStateMixin {
  AssetsType assetsType = AssetsType.collection;
  bool isFlag = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _aActiveChanged() {
    setState(() {
      assetsType = AssetsType.collection;
    });
  }

  void _aActiveChanged1() {
    setState(() {
      assetsType = AssetsType.found;
    });
  }

  void hide() {
    setState(() {
      isFlag = !isFlag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBarWidget(),
      backgroundColor: Color(0xffF9F8FA),
      body: assetsType == AssetsType.collection
          ? SingleChildScrollView(
              child: Container(
              margin: EdgeInsets.symmetric(horizontal: width(20)),
//        padding: EdgeInsets.fromLTRB(0, 0, 0, height(30)),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: height(320),
                    width: width(690),
                    padding: EdgeInsets.symmetric(
                        vertical: height(30), horizontal: width(30)),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "images/business/business_api_bg@2x.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: width(8)),
                                    child: Text('待归集总资产（USDT）：',
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
                        SizedBox(
                          height: height(10),
                        ),
                        Container(
                          padding:
                              EdgeInsets.fromLTRB(0, height(6), 0, height(16)),
                          alignment: Alignment.center,
                          child: Text(isFlag ? '****' : '0.00000000',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sp(64),
                                  height: 1.1)),
                        ),
                        SizedBox(
                          height: height(26),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              /*             onTap: () =>
                                        RouterUtil.push(context, WalletRouter.recharge),*/
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('累计转入（USDT）',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: sp(24),
                                            height: 1.1)),
                                  ),
                                  SizedBox(
                                    height: height(12),
                                  ),
                                  Container(
                                    child: Text('0.0000',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: sp(40),
                                            height: 1.1)),
                                  )
                                ],
                              ),
                            )),
                            Container(
                              width: width(1),
                              height: height(80),
                              color: Color(0xffD1ACFF),
                            ),
                            Container(
                                child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              /*               onTap: () => RouterUtil.push(
                                        context, WalletRouter.withdrawDetail),*/
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('累计转出（USDT）',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: sp(24),
                                            height: 1.1)),
                                  ),
                                  SizedBox(
                                    height: height(12),
                                  ),
                                  Container(
                                    child: Text('0.0000',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: sp(40),
                                            height: 1.1)),
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(30),
                  ),
                  CollectionNumberWidget(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(width(8)),
                        bottomRight: Radius.circular(width(8)),
                        topLeft: Radius.circular(width(8)),
                        topRight: Radius.circular(width(8)),
                      ),
                    ),
                    child: Column(
                      children: [
                        CommonItemWidget(
                          text: '地址管理',
                          image: '',
                          onTab: () {
                            RouterUtil.push(
                                context, BusinessRouter.addressManagement);
                          },
                        ),
                        CommonItemWidget(
                          text: '归集任务',
                          image: '',
                          onTab: () {
                            RouterUtil.push(
                                context, BusinessRouter.CollectTaskList);
                          },
                        ),
                        CommonItemWidget(
                          text: '交易记录',
                          image: '',
                          onTab: () {
                            RouterUtil.push(
                                context, BusinessRouter.transactionRecord);
                          },
                        ),
                        CommonItemWidget(
                          text: '交易防护',
                          image: '',
                          onTab: () {
                            RouterUtil.push(
                                context, BusinessRouter.TradeProtection);
                          },
                        ),
                        CommonItemWidget(
                            text: '交易审核',
                            image: '',
                            onTab: () {
                              RouterUtil.push(
                                  context, BusinessRouter.auditRecord);
                            }),
                        CommonItemWidget(
                          text: '数据统计',
                          image: '',
                          onTab: () {
                            RouterUtil.push(
                                context, BusinessRouter.tradeStatistic);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: height(20),
                  ),
                ],
              ),
            ))
          : FoundListView(),
    );
  }

  /// 归集数量
  CollectionNumberWidget() {
    return Container(
      width: double.infinity,
      height: height(500),
      //  color: Color(0xffEAEAEA),
      child: GridView.count(
          crossAxisCount: 2, //一行的 Widget 数量
          childAspectRatio: 0.4 / 0.2,
          //水平子Widget之间间距
          crossAxisSpacing: width(1),
          mainAxisSpacing: height(1),
          //垂直子Widget之间间距
          children: this._getListData(),
          physics: const NeverScrollableScrollPhysics()),
    );
  }

  List<Widget> _getListData() {
    List listData = [
      {
        "title": 'BTC',
        "title2": '123.0000',
        "author": '地址总量: 10个',
      },
      {
        "title": 'BTC',
        "title2": '123.0000',
        "author": '地址总量: 10个',
      },
      {
        "title": 'BTC',
        "title2": '123.0000',
        "author": '地址总量: 10个',
      },
      {
        "title": 'BTC',
        "title2": '123.0000',
        "author": '地址总量: 10个',
      },
      {
        "title": 'BTC',
        "title2": '123.0000',
        "author": '地址总量: 10个',
      },
      {
        "title": 'BTC',
        "title2": '123.0000',
        "author": '地址总量: 10个',
      },
    ];
    var tempList = listData.map((value) {
      return Container(
        color: Color(0xffffffff),
        padding: EdgeInsets.only(left: width(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Image.asset('images/wallet/hb@2x.png',
                    fit: BoxFit.contain, width: width(40), height: height(40)),
                SizedBox(
                  width: width(10),
                ),
                Text(
                  value['title'],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: sp(32), color: Color(0xff604F6A)),
                ),
              ],
            ),
            SizedBox(
              width: height(10),
            ),
            Text(
              value['title2'],
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: sp(32)),
            ),
            SizedBox(
              width: height(10),
            ),
            Text(value['author'],
                textAlign: TextAlign.left, style: TextStyle(fontSize: sp(24))),
          ],
        ),
      );
    });
    return tempList.toList();
  }

  ///*导航栏*/
  AppBar homeAppBarWidget() {
    return AppBar(
      elevation: 0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Color(0xffF9F8FA),
      title: Container(
        width: width(406),
        margin: EdgeInsets.only(left: width(20)),
        padding:
            EdgeInsets.symmetric(vertical: width(4), horizontal: height(4)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            //    borderRadius: BorderRadius.all(Radius.circular(width(32))),
            color: kTextColor4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width(196),
                height: height(64),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: assetsType == AssetsType.collection
                        ? kDefaultShadow
                        : null,
                    color: assetsType == AssetsType.collection
                        ? kWhite
                        : kTransprant),
                child: GestureDetector(
                  onTap: _aActiveChanged,
                  child: Text("归集",
                      style: TextStyle(
                        color: assetsType == AssetsType.collection
                            ? kPrimaryColor
                            : kTextColor3,
                        fontSize: 15,
                      )),
                )),
            Container(
                width: width(196),
                height: height(58),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow:
                        assetsType == AssetsType.found ? kDefaultShadow : null,
                    color:
                        assetsType == AssetsType.found ? kWhite : kTransprant),
                child: GestureDetector(
                  onTap: _aActiveChanged1,
                  child: Text("发现",
                      style: TextStyle(
                        color: assetsType == AssetsType.found
                            ? kPrimaryColor
                            : kTextColor3,
                        fontSize: 15,
                      )),
                ))
          ],
        ),
      ),
      actions: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width(48),
              height: height(48),
              margin: EdgeInsets.only(right: width(20)),
              decoration: BoxDecoration(
                  border:
                      new Border.all(color: Color(0xFF7865FE), width: width(2)),
                  borderRadius: new BorderRadius.circular(width(8))),
              alignment: Alignment.center,
              child: GestureDetector(
                child: Text('+',
                    style: TextStyle(
                      color: Color(0xFF7865FE),
                      fontSize: 12,
                    )),
                onTap: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}

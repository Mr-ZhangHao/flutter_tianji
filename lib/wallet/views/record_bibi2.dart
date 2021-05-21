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

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/wallet/model/bibi_recored_model.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:flutter_tianji/wallet/routes/index.dart';
import 'package:flutter_tianji/wallet/server/index.dart';
import 'package:flutter_tianji/wallet/widgets/RecordItemWidget.dart';
import 'package:flutter_tianji/wallet/widgets/drawer.dart';
import 'package:provider/provider.dart';

class RecordBibiPage2 extends PageList {
  final String coinName;
  final String id;
  RecordBibiPage2({Key key, this.coinName,this.id}) : super(key: key);
  @override
  _RecordBibiPage2State createState() => _RecordBibiPage2State();
}

class _RecordBibiPage2State extends PageListState<BibiRecored, RecordBibiPage2> {
  Map params = {};

  @override
  Widget build(BuildContext context) {
    params = {"coin_id": '${(widget as RecordBibiPage2).id}', "type": 0, "time": 0};
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
        title: Text((widget as RecordBibiPage2).coinName,
            style: TextStyle(color: kTextColor3, fontSize: sp(36))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: height(220),
            padding: EdgeInsets.only(left: width(20), right: width(20)),
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
         Container(
           padding: EdgeInsets.only(left: width(20), right: width(20),top: height(60)),

           child:  Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 '${Tr.of(context).assetCoinrecord}',
                 style: TextStyle(color: kTextColor3, fontSize: sp(28)),
               ),
           /*    Builder(builder: (context) {
                 return GestureDetector(
                   onTap: () => Scaffold.of(context).openEndDrawer(),
                   child: Container(
                       padding: EdgeInsets.symmetric(horizontal: width(20)),
                       child: ImageIcon(AssetImage('images/home/shaixuan.png'),color: Color(0xff323232),
                           size: sp(44))),
                 );
               }),*/
             ],
           ),
         ),

          Expanded(child: buildList(context))
        ],
      ),
 /*     endDrawer: RecoredDrawer(
        onTab: (map) {
          setState(() => params = map);
          loadData(1);
        },
      ),*/
    );
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  ///加载数据
  @override
  loadPage(
      {int page, Function(List<BibiRecored>) onSuccess, Function onErr}) async {
    try {

      List<BibiRecored> list = await WalletServer.bibiRecord({
        "coin_id": (widget as RecordBibiPage2).id,
      });
      print("coin_id:"+(widget as RecordBibiPage2).id);
      print("coin_id2:"+params['coin_id']);
      onSuccess(list);
    } catch (e) {
      onErr(e);
    }
  }

  @override
  buildItem(BibiRecored model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(24)),
      child: RecordItemWidget(model: model),
    );
  }

  @override
  empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/business/no_task.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text('${Tr.of(context).homeNodata}',
              style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }

  @override
  buildFooter() {
    return SizedBox(
      child: Text('${Tr.of(context).assetNoMore}'),
    );
  }
}

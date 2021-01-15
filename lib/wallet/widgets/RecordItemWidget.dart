import 'dart:convert';


import 'package:flutter/material.dart'hide Router;
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/wallet/model/bibi_recored_model.dart';
import 'package:flutter_tianji/wallet/routes/index.dart';


class RecordItemWidget extends StatelessWidget {
  final BibiRecored model;
  const RecordItemWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        String item = json.encode(model);
        RouterUtil.push(context, "${WalletRouter.recordDetail}?param=${Uri.encodeComponent(item)}");
      },
      child: Container(
          margin: EdgeInsets.only(top: height(32)),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(width(8)), boxShadow: [
            BoxShadow(
                color: Color(0xffE9E9E9),
                offset: Offset(0.0, height(8)), //阴影xy轴偏移量
                blurRadius: 24.0, //阴影模糊程度
                spreadRadius: 1.0 //阴影扩散程度
                )
          ]),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: width(30), horizontal: height(20)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: height(20)),
                      child: Text(model.opName, style: TextStyle(color: Color(0xff323232), fontSize: sp(28))),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(vertical: height(20)),
                      child: Text("${num.parse(model.number) > 0 ? '+' : ''}${Utils.cutZero(model.number)}",
                          style: TextStyle(
                              color: num.parse(model.number) < 0 ? kRedColor : kGreenColor,
                              fontSize: sp(32),
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(model.createdAt, style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(model.status, style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height(9)),
                          height: width(12),
                          width: width(22),
                          child: Image.asset('images/mine/pointer.png',
                              fit: BoxFit.contain, width: width(12), height: height(22)),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

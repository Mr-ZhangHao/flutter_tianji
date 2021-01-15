import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/model/auditRecordModel.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 审核记录item */
class auditRecordItem extends StatelessWidget {
  final auditRecordModel model;
  const auditRecordItem({
    Key key,
    @required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Utils.normalText("转出地址："),
              Utils.normalText("0x7a912sdhlsdadsfhsdfts3"),
              SizedBox(
                width: width(36),
              ),
              GestureDetector(
                child: Image.asset(
                  'images/business/icon_copy.png',
                  width: width(40),
                  height: width(40),
                  fit: BoxFit.contain,
                ),
                onTap: () {},
              )
            ],
          ),
          SizedBox(
            height: height(20),
          ),
          Row(
            children: [
              Utils.normalText("接收地址："),
              Utils.normalText("0x7a912sdhlsdadsfhsdfts3"),
              SizedBox(
                width: width(36),
              ),
              GestureDetector(
                child: Image.asset(
                  'images/business/icon_copy.png',
                  width: width(40),
                  height: width(40),
                  fit: BoxFit.contain,
                ),
                onTap: () {},
              )
            ],
          ),
          SizedBox(
            height: height(20),
          ),
          Row(
            children: [
              Utils.normalText("交易数量:"),
              Utils.normalText("1.250000001 BTC"),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [Utils.normalText("创建时间:2020-10-27  12:10:36")],
                ),
                flex: 1,
              ),
              Container(
                width: width(130),
                height: height(60),
                margin: EdgeInsets.only(right: width(20)),
                decoration: BoxDecoration(
                    border: new Border.all(
                        color: Color(0xFF7865FE), width: width(2)),
                    borderRadius: new BorderRadius.circular(width(8))),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Text('审核',
                      style: TextStyle(
                        color: Color(0xFF7865FE),
                        fontSize: 12,
                      )),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ]);
  }
}

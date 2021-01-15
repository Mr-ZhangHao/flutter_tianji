import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 交易记录详情*/
class tradeRecordDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.getCommonAppBar(context, '账单详情', elevation: 1.0),
        body: Container(
          height: height(584),
          padding: EdgeInsets.all(width(30)),
          child: Card(
            child: Padding(
              //左内边距
              padding: EdgeInsets.symmetric(horizontal: width(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Utils.normalText('转入'),
                  Row(
                    children: [
                      Expanded(
                        child: Utils.normalText('+97.650000000',
                            color: Color(0xff4DBA8E)),
                      ),
                      Utils.normalText('BTC',
                          fontSize: 40, fontWeight: FontWeight.w600),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.5, color: kDividerColor))),
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Utils.normalText('交易ID',
                              color: Color(0xff909090))),
                      Utils.normalText('297397367', color: Color(0xff909090)),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Utils.normalText('交易时间',
                              color: Color(0xff909090))),
                      Utils.normalText('2020-08-26  15:32',
                          color: Color(0xff909090)),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Utils.normalText('转出地址',
                              color: Color(0xff909090))),
                      Utils.normalText('jhdkdhsiehgfb3j30nzxnssdhjdks528h',
                          color: Color(0xff909090)),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Utils.normalText('接收地址',
                              color: Color(0xff909090))),
                      Utils.normalText('oxdddlzakb3j30nzx73asklxnssoiuyyte',
                          color: Color(0xff909090)),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Utils.normalText('交易数量',
                              color: Color(0xff909090))),
                      Utils.normalText('123.9000000', color: Color(0xff909090)),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Utils.normalText('交易状态',
                              color: Color(0xff909090))),
                      Utils.normalText('成功', color: Color(0xff909090)),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

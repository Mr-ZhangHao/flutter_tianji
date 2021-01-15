import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/routes/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';

/* 交易记录item*/
class TransactionRecordListItem extends StatelessWidget {
  final String type;
  final String Currency;
  final String address;
  final String Creationtime;
  final double amount;
  const TransactionRecordListItem({
    Key key,
    @required this.type,
    @required this.Currency,
    @required this.address,
    @required this.Creationtime,
    @required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styleBig = TextStyle(
      color: kTextColor3,
    );
    TextStyle styleSm = TextStyle(fontSize: sp(28), color: kBlack);
    return GestureDetector(
      child: Container(
          height: height(268),
          margin: EdgeInsets.only(left: width(40)),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: kDividerColor))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('类型：${type}', style: styleSm),
              SizedBox(
                height: height(24),
              ),
              Row(
                children: [
                  Text('地址：${address}', style: styleSm),
                  SizedBox(
                    width: width(22),
                  ),
                  GestureDetector(
                    child: Image.asset('images/business/icon_copy.png',
                        width: width(40), height: height(40)),
                  )
                ],
              ),
              SizedBox(
                height: height(20),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('创建时间：${Creationtime}', style: styleSm),
                      SizedBox(
                        height: height(22),
                      ),
                      Text('可用余额：${amount}' + '${Currency}', style: styleSm)
                    ],
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Image.asset('images/business/icon_state_confirm.png',
                      width: width(120), height: height(90)),
                ],
              )
            ],
          )),
      onTap: () {
        RouterUtil.push(context, BusinessRouter.tradeRecordDetail);
      },
    );
  }
}

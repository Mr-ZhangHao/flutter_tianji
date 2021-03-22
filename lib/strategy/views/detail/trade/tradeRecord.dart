import 'package:flutter/material.dart';
import 'package:flutter_tianji/strategy/views/detail/trade/traderRecordListView.dart';
import 'package:flutter_tianji/utils/screen.dart';

/*  
  订单详情交易记录
 */
class tradeRecordPage extends StatefulWidget {
  @override
  _tradeRecordPageState createState() => _tradeRecordPageState();
}

class _tradeRecordPageState extends State<tradeRecordPage> {
  int type = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(30)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width(150),
                height: height(60),
                margin: EdgeInsets.only(right: width(20)),
                decoration: BoxDecoration(
                    border: new Border.all(
                        color:
                            type == 1 ? Color(0xFF7865FE) : Color(0xff909090),
                        width: width(2)),
                    borderRadius: new BorderRadius.circular(width(8))),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('正在持仓',
                          style: TextStyle(
                            color: type == 1
                                ? Color(0xFF7865FE)
                                : Color(0xff909090),
                            fontSize: 12,
                          )),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      type = 1;
                    });
                  },
                ),
              ),
              Container(
                width: width(150),
                height: height(60),
                margin: EdgeInsets.only(right: width(20)),
                decoration: BoxDecoration(
                    border: new Border.all(
                        color:
                            type == 1 ? Color(0xff909090) : Color(0xFF7865FE),
                        width: width(2)),
                    borderRadius: new BorderRadius.circular(width(8))),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('历史记录',
                          style: TextStyle(
                            color: type == 1
                                ? Color(0xff909090)
                                : Color(0xFF7865FE),
                            fontSize: 12,
                          )),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      type = 2;
                    });
                  },
                ),
              ),
            ],
          ),
          Visibility(
            child: Expanded(
                child: traderRecordListView(
              index: 1,
            )),
            visible: type == 1,
          ),
          Visibility(
            child: Expanded(
                child: traderRecordListView(
              index: 2,
            )),
            visible: type == 2,
          )
        ],
      ),
    );
  }
}

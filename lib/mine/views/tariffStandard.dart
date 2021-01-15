import 'package:flutter/material.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class tariffStandardPage extends StatefulWidget {
  @override
  _tariffStandardPageState createState() => _tariffStandardPageState();
}

class _tariffStandardPageState extends State<tariffStandardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('资费标准'),
          centerTitle: true,
          elevation: 1,
          leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => RouterUtil.goBack(context),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/mine/back@2x.png',
                    width: width(22), height: height(36)),
              )),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: width(30), right: width(30)),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                print(i);
                return Container(
                  height: height(240),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0xffEBEBEB)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Utils.normalText('BTC', fontWeight: FontWeight.bold),
                      SizedBox(
                        height: height(40),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.normalText('提币手续费：0.005',
                              color: Color(0xff909090)),
                          SizedBox(
                            width: width(40),
                          ),
                          Utils.normalText('单笔限额：2,000',
                              color: Color(0xff909090)),
                        ],
                      ),
                      SizedBox(
                        height: height(40),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.normalText('提币手续费：0.005',
                              color: Color(0xff909090)),
                          SizedBox(
                            width: width(30),
                          ),
                          Utils.normalText('单笔限额：2,000',
                              color: Color(0xff909090)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class buddyListPage extends StatefulWidget {
  @override
  _buddyListPageState createState() => _buddyListPageState();
}

class _buddyListPageState extends State<buddyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的好友'),
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
                  height: height(102),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0xffEBEBEB)))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Utils.normalText('158****6545',
                            textAlign: TextAlign.left),
                      ),
                      Expanded(
                        child: Utils.normalText('2020-01  12:14:36',
                            textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child:
                            Utils.normalText('有效', textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}

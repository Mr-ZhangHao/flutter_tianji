import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/view/projectList.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class myCollection extends StatefulWidget {
  @override
  _myCollectionState createState() => _myCollectionState();
}

class _myCollectionState extends State<myCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的关注'),
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
      body: Column(
        children: [
          Container(
            height: height(88),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    child: Utils.normalText('名称', textAlign: TextAlign.center)),
                Expanded(
                    child: Utils.normalText('分类', textAlign: TextAlign.center)),
                Expanded(
                    child: Utils.normalText('评级', textAlign: TextAlign.center)),
                Expanded(
                    child: Utils.normalText('热度', textAlign: TextAlign.center)),
                /*      Container(
                      padding: EdgeInsets.symmetric(horizontal: width(20)),
                      child: Image.asset('images/business/icon_screen.png',
                          width: width(48), height: height(48))) */
              ],
            ),
          ),
          Expanded(child: projectListPage())
        ],
      ),
    );
  }
}

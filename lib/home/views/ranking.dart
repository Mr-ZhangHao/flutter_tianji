import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/baike/view/myCollectionList.dart';
import 'package:flutter_tianji/baike/view/projectList.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/home/views/rankingList.dart';
import 'package:flutter_tianji/home/views/rankingList2.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tianji/baike/server/index.dart';

class ranking extends StatefulWidget {
  @override
  _rankingState createState() => _rankingState();
}

class _rankingState extends State<ranking> {
  @override
  void initState() {
    super.initState();

    Provider.of<baikeProvider>(context, listen: false).getCollectionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text('排行榜'),
        centerTitle: true,
        elevation: 0.5,
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
            width: double.infinity,
            height: height(100),
            padding: EdgeInsets.symmetric(horizontal: width(24)),
            child: Row(
              children: [
                Container(
                  width: width(200),
                  child:  Utils.normalText("排名", textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Utils.normalText("账号", textAlign: TextAlign.left)
                    ],
                  ),
                  flex: 1,
                ),
                Container(
                  width: width(200),
                  child:  Utils.normalText("年化收益率", color: Colors.red,textAlign: TextAlign.right),
                ),
              ],
            ),
          ),
         Expanded(child:  rankingList2())
        ],
      ),
    );
  }
}

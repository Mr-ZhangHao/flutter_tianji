import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/view/projectList.dart';
import 'package:flutter_tianji/common/event/allStartegyEvent.dart';
import 'package:flutter_tianji/common/event/projectListEvent.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class projectPage extends StatefulWidget {
  @override
  _projectPageState createState() => _projectPageState();
}

class _projectPageState extends State<projectPage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: height(88),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child:
                          Utils.normalText('名称', textAlign: TextAlign.center,color: Color(0xff666666)),flex: 2,),
                  Expanded(
                      child:
                          Utils.normalText('分类', textAlign: TextAlign.center,color: Color(0xff666666))),
                  Expanded(
                      child:
                          Utils.normalText('评级', textAlign: TextAlign.center,color: Color(0xff666666))),
                  Expanded(
                      child:
                          Utils.normalText('热度', textAlign: TextAlign.center,color: Color(0xff666666))),
                  GestureDetector(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width(20)),
                        child: Image.asset('images/business/icon_screen.png',
                            width: width(40), height: height(40))),
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: height(20),
              color: Color(0xffF9F8FA),
            ),
            Expanded(
              child: projectListPage(),
            )
          ],
        ));
  }
}

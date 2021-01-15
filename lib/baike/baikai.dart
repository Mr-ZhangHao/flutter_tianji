import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/baike/view/baikeRightDrawe.dart';
import 'package:flutter_tianji/baike/view/project.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';

// 项目百科
enum ProjectBaikeType {
  // 项目
  Project,
  // 资讯
  News
}

class Baike extends StatefulWidget {
  @override
  _BaikeState createState() => _BaikeState();
}

class _BaikeState extends State<Baike> {
  ProjectBaikeType assetsType = ProjectBaikeType.Project;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _aActiveChanged() {
    setState(() {
      assetsType = ProjectBaikeType.Project;
    });
  }

  void _aActiveChanged1() {
    setState(() {
      assetsType = ProjectBaikeType.News;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBarWidget(),
      backgroundColor: Color(0xffF9F8FA),
      body: projectPage(),
      endDrawer: baikeRightDrawe(
        onTab: (e) async {},
      ),
    );
  }

  ///*导航栏*/
  AppBar homeAppBarWidget() {
    return AppBar(
      elevation: 0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Container(
        width: width(406),
        margin: EdgeInsets.only(left: width(20)),
        padding:
            EdgeInsets.symmetric(vertical: width(4), horizontal: height(4)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(width(4))),
            color: kTextColor4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width(196),
                height: height(64),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width(4))),
                    boxShadow: assetsType == ProjectBaikeType.Project
                        ? kDefaultShadow
                        : null,
                    color: assetsType == ProjectBaikeType.Project
                        ? kWhite
                        : kTransprant),
                child: GestureDetector(
                  onTap: _aActiveChanged,
                  child: Text("项目",
                      style: TextStyle(
                        color: assetsType == ProjectBaikeType.Project
                            ? kPrimaryColor
                            : kTextColor3,
                        fontSize: 15,
                      )),
                )),
            Container(
                width: width(196),
                height: height(58),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width(4))),
                    boxShadow: assetsType == ProjectBaikeType.News
                        ? kDefaultShadow
                        : null,
                    color: assetsType == ProjectBaikeType.News
                        ? kWhite
                        : kTransprant),
                child: GestureDetector(
                  onTap: _aActiveChanged1,
                  child: Text("资讯",
                      style: TextStyle(
                        color: assetsType == ProjectBaikeType.News
                            ? kPrimaryColor
                            : kTextColor3,
                        fontSize: 15,
                      )),
                ))
          ],
        ),
      ),
      actions: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width(50),
              height: height(64),
              margin: EdgeInsets.only(right: width(20)),
              alignment: Alignment.center,
              child: GestureDetector(
                child: Image.asset("images/baike/shoucang@2x.png"),
                onTap: () {
                  RouterUtil.push(context, BaikeRouter.mycollection);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

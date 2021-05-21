import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/baike/view/baikeRightDrawe.dart';
import 'package:flutter_tianji/baike/view/news.dart';
import 'package:flutter_tianji/baike/view/project.dart';
import 'package:flutter_tianji/business/views/found.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/event/newsEvent.dart';
import 'package:flutter_tianji/common/event/projectListEvent.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:provider/provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<baikeProvider>(context, listen: false).getscreenType();
      Provider.of<baikeProvider>(context, listen: false).getBanner();
    });
    Application.eventBus.on<newsEvent>().listen((event) {
      if (mounted) {
        setState(() {
          assetsType = ProjectBaikeType.News;
        });
      }
    });

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
  String selecType = '';

  Map<String, dynamic> map = {
/*    "id": cateList[i].id,
    "name": cateList[i].name,*/
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBarWidget(),
      backgroundColor: Color(0xffF9F8FA),
      body:assetsType == ProjectBaikeType.Project ? projectPage():NewListView(),
      endDrawer: baikeRightDrawe(
        onTab: (e) async {
          print("id2:"+e['id'].toString());
          print("level2"
              ":"+e['level'].toString());
          Application.eventBus
              .fire(projectListEvent(e['id'],e['level']));
        },
      ),
    );
  }

  ///*导航栏*/
  AppBar homeAppBarWidget() {
    return AppBar(
      elevation: 0.2,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Container(
        width: width(410),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(width(4))),
            color: Color(0xffEDEEEF)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width(196),
                height: height(56),
                margin: EdgeInsets.all(width(4)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width(4))),
                    boxShadow: assetsType == ProjectBaikeType.Project
                        ? kDefaultShadow
                        : null,
                    color: assetsType == ProjectBaikeType.Project
                        ? kWhite
                        : Color(0xffEDEEEF)),
                child: GestureDetector(
                  onTap: _aActiveChanged,
                  child: Text("项目",
                      style: TextStyle(
                        color: assetsType == ProjectBaikeType.Project
                            ? kPrimaryColor
                            : kTextColor6,
                        fontSize: sp(28),
                        fontWeight: FontWeight.w500,
                      )),
                )),
            Container(
                width: width(196),
                height: height(56),
                alignment: Alignment.center,
                margin: EdgeInsets.all(width(4)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width(4))),
                    boxShadow: assetsType == ProjectBaikeType.News
                        ? kDefaultShadow
                        : null,
                    color: assetsType == ProjectBaikeType.News
                        ? kWhite
                        : Color(0xffEDEEEF)),
                child: GestureDetector(
                  onTap: _aActiveChanged1,
                  child: Text("资讯",
                      style: TextStyle(
                        color: assetsType == ProjectBaikeType.News
                            ? kPrimaryColor
                            : kTextColor6,
                        fontSize: sp(28),
                        fontWeight: FontWeight.w500,
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
              width: width(40),
              height: height(40),
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

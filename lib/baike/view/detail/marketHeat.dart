import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 市场热度 */
class marketHeatPage extends StatefulWidget {
  @override
  _marketHeatPageState createState() => _marketHeatPageState();
}

class _marketHeatPageState extends State<marketHeatPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  Animation animation;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    animation = Tween(begin: 0.0, end: 2.0 * pi).animate(animationController);
    //开始动画
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height(30),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: animation.value,
              child: child,
            );
          },
          child: Container(
            width: width(420),
            height: height(376),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('images/baike/value_evaluat@2x.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Utils.normalText('A',
                    color: Color(0xffFFFFFF),
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: width(30),
            ),
            Container(
              width: width(180),
              child: Utils.normalText('各平台关注度'),
            ),
            SizedBox(
              width: width(20),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(right: width(30)),
                  child: circularProgress(
                      progressColor: Color(0xff38CDE3), percentage: 0.50)),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: width(30),
            ),
            Container(
              width: width(180),
              child: Utils.normalText(
                '搜索热度',
              ),
            ),
            SizedBox(
              width: width(20),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(right: width(30)),
                    child: circularProgress(
                        progressColor: Color(0xfff388DE3), percentage: 0.50))),
          ],
        ),

        /* 各平台关注度 */
        SizedBox(
          height: height(30),
        ),
        Container(
          width: double.infinity,
          height: height(20),
          color: Color(0xffF9F8FA),
        ),
        SizedBox(
          height: height(30),
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width(30),
                ),
                Utils.normalText('各平台关注度', fontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(
              height: height(20),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width(30)),
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    new Border.all(color: Color(0xffD3D1D1), width: width(0.5)),
                color: Color(0xffF2F1F3),
              ),
              child: Column(
                children: [
                  Container(
                    height: height(70),
                    color: Color(0xffE7EEFF),
                    child: Row(
                      children: [
                        Expanded(
                            child: Utils.normalText('维度',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Utils.normalText('关注人数',
                              color: Color(0xff293E91),
                              textAlign: TextAlign.start),
                        ),
                        Expanded(
                            child: Utils.normalText('总分',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Utils.normalText('实得',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                  Container(
                    height: height(70),
                    color: Color(0xffFFFFFF),
                    child: Row(
                      children: [
                        Expanded(
                            child: Utils.normalText('基本信息',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Utils.normalText('基本信息完整',
                              color: Color(0xff293E91),
                              textAlign: TextAlign.start),
                        ),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                  Container(
                    height: height(70),
                    color: Color(0xffF6F8FB),
                    child: Row(
                      children: [
                        Expanded(
                            child: Utils.normalText('团队信息',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Utils.normalText('团队完整',
                              color: Color(0xff293E91),
                              textAlign: TextAlign.start),
                        ),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        /* 搜索热度 */
        SizedBox(
          height: height(30),
        ),
        Container(
          width: double.infinity,
          height: height(20),
          color: Color(0xffF9F8FA),
        ),
        SizedBox(
          height: height(30),
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width(30),
                ),
                Utils.normalText('搜索热度', fontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(
              height: height(20),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width(30)),
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    new Border.all(color: Color(0xffD3D1D1), width: width(0.5)),
                color: Color(0xffF2F1F3),
              ),
              child: Column(
                children: [
                  Container(
                    height: height(70),
                    color: Color(0xffE7EEFF),
                    child: Row(
                      children: [
                        Expanded(
                            child: Utils.normalText('维度',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Utils.normalText('关注人数',
                              color: Color(0xff293E91),
                              textAlign: TextAlign.start),
                        ),
                        Expanded(
                            child: Utils.normalText('总分',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Utils.normalText('实得',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                  Container(
                    height: height(70),
                    color: Color(0xffFFFFFF),
                    child: Row(
                      children: [
                        Expanded(
                            child: Utils.normalText('基本信息',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Utils.normalText('基本信息完整',
                              color: Color(0xff293E91),
                              textAlign: TextAlign.start),
                        ),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                  Container(
                    height: height(70),
                    color: Color(0xffF6F8FB),
                    child: Row(
                      children: [
                        Expanded(
                            child: Utils.normalText('团队信息',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Utils.normalText('团队完整',
                              color: Color(0xff293E91),
                              textAlign: TextAlign.start),
                        ),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Utils.normalText('7',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: height(30),
        ),
      ],
    ));
  }

  Widget circularProgress({bgColor, progressColor, percentage}) {
    return Container(
        height: height(18),
        decoration: BoxDecoration(
          border: new Border.all(color: Color(0xffD3D1D1), width: width(0.5)),
          color: bgColor != null ? bgColor : Color(0xffF2F1F3),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height(17),
                width:
                    width(percentage != null ? 520 * percentage : 520 * 0.10),
                decoration: BoxDecoration(
                  color:
                      progressColor != null ? progressColor : Color(0xff38CDE3),
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ))
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class riskAssessmentPage extends StatefulWidget {
  @override
  _riskAssessmentPageState createState() => _riskAssessmentPageState();
}

class _riskAssessmentPageState extends State<riskAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height(30),
        ),
        Container(
          width: width(420),
          height: height(376),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/baike/risk@2x.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 30),
              child: Utils.normalText('21    低', color: Color(0xff7865FE)),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: width(30),
            ),
            Container(
                width: width(120),
                child: Utils.normalText(
                  '信息透明',
                )),
            SizedBox(
              width: width(20),
            ),
            circularProgress(
                progressColor: Color(0xff38CDE3), percentage: 0.50),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: width(30),
            ),
            Container(
              width: width(120),
              child: Utils.normalText(
                '信息真实',
              ),
            ),
            SizedBox(
              width: width(20),
            ),
            circularProgress(
                progressColor: Color(0xfff388DE3), percentage: 0.50),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: width(30),
            ),
            Container(
                width: width(120),
                child: Utils.normalText(
                  '融资合规',
                )),
            SizedBox(
              width: width(20),
            ),
            circularProgress(
                progressColor: Color(0xffB841EE), percentage: 0.50),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: width(30),
            ),
            Container(
                width: width(120),
                child: Utils.normalText(
                  '调节项',
                )),
            SizedBox(
              width: width(20),
            ),
            circularProgress(
                progressColor: Color(0xffEC5D8F), percentage: 0.50),
          ],
        ),
        /* 信息透明 */
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
                Utils.normalText('信息透明', fontWeight: FontWeight.bold),
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
                          child: Utils.normalText('判定',
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
        /* 信息真实 */
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
                Utils.normalText('信息真实', fontWeight: FontWeight.bold),
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
                          child: Utils.normalText('判定',
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
        /* 融资合规 */
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
                Utils.normalText('融资合规', fontWeight: FontWeight.bold),
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
                          child: Utils.normalText('判定',
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
        /* 调节项 */
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
                Utils.normalText('调节项', fontWeight: FontWeight.bold),
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
                          child: Utils.normalText('判定',
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
                            child: Utils.normalText('估值',
                                color: Color(0xff293E91),
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Utils.normalText('适中',
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
        width: width(520),
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

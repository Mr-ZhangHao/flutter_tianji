import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

/* 价值评级 */
class valueEvaluation extends StatefulWidget {
  @override
  _valueEvaluationState createState() => _valueEvaluationState();
}

class _valueEvaluationState extends State<valueEvaluation>
    with SingleTickerProviderStateMixin{
  List<Color> colorList = [
    Color(0xff38CDE3),
    Color(0xfff388DE3),
    Color(0xffB841EE),
    Color(0xffEC5D8F),
    Color(0xff38CDE3),
    Color(0xfff388DE3),
    Color(0xffB841EE),
    Color(0xffEC5D8F),
    Color(0xff38CDE3),
    Color(0xfff388DE3),
    Color(0xffB841EE),
    Color(0xffEC5D8F)
  ];
  AnimationController _ctrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _ctrl.forward();
    _ctrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
//执行结束反向执行
        //   _ctrl.reverse();
     //   _ctrl.forward();
      } else if (status == AnimationStatus.dismissed) {
//反向执行结束正向执行
        _ctrl.forward();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<baikeProvider>(
        builder: (BuildContext context, baikeProvider model, Widget child) {
      return model.isIdle ? SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height(30),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: width(400),
                height: height(300),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('images/baike/value_evaluat_bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
             Positioned(child:
               Stack(
                 alignment: Alignment.center,
                 children: [
                   RotationTransition(
                       turns: CurvedAnimation(
                           parent: _ctrl, curve: Curves.linear),
                       child: Container(
                         width: 140,
                         height: 140,
                         decoration: new BoxDecoration(
                           image: new DecorationImage(
                             image: new AssetImage('images/baike/value_evaluat_bg2.png'),
                             fit: BoxFit.fill,
                           ),
                         ),

                       )),
                   Center(
                     child: Padding(
                       padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                       child: Utils.normalText(
                           '${model.projectDetail.levels.descript.grade[1].level ?? ""}',
                           color: Color(0xffFFFFFF),
                           fontSize: 36,
                           fontWeight: FontWeight.bold),
                     ),
                   ),
                 ],
               )
               ,)
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: height(50 *
                double.parse(model
                    .projectDetail.levels.descript.grade[1].subordinate.length
                    .toString())),
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: model.projectDetail.levels.descript.grade[1].subordinate
                            .length >
                        0
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.projectDetail.levels.descript.grade[1]
                            .subordinate.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(top: height(10)),
                            height: height(40),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width(30),
                                ),
                                /*    Container(
                                    width: width(150),
                                    child: Utils.normalText(
                                      '${model.projectDetail.levels.descript.grade[1].subordinate[index].name}',
                                    )),*/
                                Container(
                                  width: width(150),
                                  child: Text(
                                    '${model.projectDetail.levels.descript.grade[1].subordinate[index].name ?? ""}',
                                    maxLines: 1,
                                    style: TextStyle(fontSize: sp(28)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: width(20),
                                ),
                                circularProgress(
                                    progressColor: colorList[index],
                                    percentage: double.parse(model
                                            .projectDetail
                                            .levels
                                            .descript
                                            .grade[1]
                                            .subordinate[index]
                                            .rate) /
                                        100),
                              ],
                            ),
                          );
                        })
                    : Container()),
          ),
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: model.projectDetail.levels.descript.grade[1].subordinate
                          .length >
                      0
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: model.projectDetail.levels.descript.grade[1]
                          .subordinate.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width(30),
                                      ),
                                      Utils.normalText(
                                          '${model.projectDetail.levels.descript.grade[1].subordinate[index].name ?? ""}',
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height(20),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width(30)),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: new Border.all(
                                          color: Color(0xffD3D1D1),
                                          width: width(0.5)),
                                      color: Color(0xffF2F1F3),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: height(70),
                                          color: Color(0xffE6E6E6),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Utils.normalText('维度',
                                                      color: kPrimaryColor,
                                                      textAlign:
                                                          TextAlign.center)),
                                              Expanded(
                                                child: Utils.normalText('判定',
                                                    color: kPrimaryColor,
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              Expanded(
                                                  child: Utils.normalText('总分',
                                                      color: kPrimaryColor,
                                                      textAlign:
                                                          TextAlign.center)),
                                              Expanded(
                                                  child: Utils.normalText('实得',
                                                      color: kPrimaryColor,
                                                      textAlign:
                                                          TextAlign.center)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: height(70 *
                                              double.parse(model
                                                  .projectDetail
                                                  .levels
                                                  .descript
                                                  .grade[1]
                                                  .subordinate[index]
                                                  .grade
                                                  .length
                                                  .toString())),
                                          child: MediaQuery.removePadding(
                                              removeTop: true,
                                              context: context,
                                              child: model
                                                          .projectDetail
                                                          .levels
                                                          .descript
                                                          .grade[1]
                                                          .subordinate[index]
                                                          .grade
                                                          .length >
                                                      0
                                                  ? ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount: model
                                                          .projectDetail
                                                          .levels
                                                          .descript
                                                          .grade[1]
                                                          .subordinate[index]
                                                          .grade
                                                          .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index2) {
                                                        return Container(
                                                          height: height(70),
                                                          color:
                                                          index2%2==0? Color(0xffFFFFFF):Color(0xffF6F8FB),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width:
                                                                    width(160),
                                                                child: Text(
                                                                    '${model.projectDetail.levels.descript.grade[1].subordinate[index].grade[index2].name ?? ""}',
                                                                    maxLines: 1,
                                                                    style: TextStyle(
                                                                        fontSize: sp(
                                                                            28)),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center),
                                                              ),
                                                              Container(
                                                                width:
                                                                    width(180),
                                                                child: Text(
                                                                    '${model.projectDetail.levels.descript.grade[1].subordinate[index].grade[index2].content ?? ""}',
                                                                    maxLines: 1,
                                                                    style: TextStyle(
                                                                        fontSize: sp(
                                                                            28)),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center),
                                                              ),
                                                              Expanded(
                                                                  child: Utils.normalText(
                                                                      '${model.projectDetail.levels.descript.grade[1].subordinate[index].grade[index2].totalScore ?? ""}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center)),
                                                              Expanded(
                                                                  child: Utils.normalText(
                                                                      '${model.projectDetail.levels.descript.grade[1].subordinate[index].grade[index2].score ?? ""}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center)),
                                                            ],
                                                          ),
                                                        );
                                                      })
                                                  : Container()),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                  : Container()),
          SizedBox(
            height: height(30),
          ),
        ],
      )):Center(
        child: CupertinoActivityIndicator(),
      );
    });
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

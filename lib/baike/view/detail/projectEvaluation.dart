import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/model/pieData.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
import 'package:flutter_tianji/utils/MyCustomCircle.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

/* 项目评测 */
class projectEvaluationPage extends StatefulWidget {
  @override
  _projectEvaluationPageState createState() => _projectEvaluationPageState();
}

class _projectEvaluationPageState extends State<projectEvaluationPage> {
  //数据源 下标  表示当前是PieData哪个对象
  int subscript = 0;

  //数据源
  List<PieData> mData;

  //传递值
  PieData pieData;

  //当前选中
  var currentSelect = 0;

  ///初始化 控制器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化 扇形 数据
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<baikeProvider>(
        builder: (BuildContext context, baikeProvider model, Widget child) {
      return model.isIdle ? Column(children: [
        Container(
          margin: EdgeInsets.only(
              left: width(30), right: width(30), top: height(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/home/icon_quantify.png',
                      width: 48, height: 48),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText('${model.projectDetail.name ??""}', fontWeight: FontWeight.bold),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Utils.normalText('综合评分：',color: Color(0xff999999)),
                      Utils.normalText('${model.projectDetail.score ??""}分',
                          color: Color(0xffFF4D4D),
                          fontWeight: FontWeight.bold),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: height(30),
              ),
              Utils.normalText('项目简介', fontWeight: FontWeight.bold,fontSize: 32),
              SizedBox(
                height: height(30),
              ),
              Utils.normalText(
                  '${model.projectDetail.description ??""}'),
              SizedBox(
                height: height(30),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Utils.normalText('官网链接：',color: Color(0xff999999)),
                  Utils.normalText('${model.projectDetail.link ??""}',
                      color: Color(0xff1770FF), fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(
                height: height(20),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Utils.normalText('APP下载：',color: Color(0xff999999)),
                  Utils.normalText('${model.projectDetail.download ??""}',
                      color: Color(0xff1770FF), fontWeight: FontWeight.bold),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: height(30),
        ),
        Container(
          width: double.infinity,
          height: height(20),
          color: Color(0xffF9F8FA),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: width(20), top: height(30)),
              child: MyCustomCircle(mData, pieData, currentSelect),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: width(150), top: height(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff82BAFF),
                      borderRadius: new BorderRadius.all(
                          new Radius.circular(width(1000))),
                    ),
                    width: width(9),
                    height: height(8),
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText('流动性      ${model.projectDetail.levels.descript.grade[3].rate}%')
                ],

              ),
              SizedBox(height: height(20),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFF9999),
                      borderRadius: new BorderRadius.all(
                          new Radius.circular(width(1000))),
                    ),
                    width: width(9),
                    height: height(8),
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText('风险评级 ${model.projectDetail.levels.descript.grade[0].rate}% ')
                ],
              ),
              SizedBox(height: height(20),),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFC499),
                      borderRadius: new BorderRadius.all(
                          new Radius.circular(width(1000))),
                    ),
                    width: width(9),
                    height: height(8),
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText('市场热度 ${model.projectDetail.levels.descript.grade[1].rate}% ')
                ],
              ),
              SizedBox(height: height(20),),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff6FE4FF),
                      borderRadius: new BorderRadius.all(
                          new Radius.circular(width(1000))),
                    ),
                    width: width(9),
                    height: height(8),
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText('风险评级 ${model.projectDetail.levels.descript.grade[3].rate}% ')
                ],
              ),
            ],
          ),
        )
      ]):Center(
        child: CupertinoActivityIndicator(),
      );
    });
  }

  void initData() {
    mData = new List();
    PieData p1 = new PieData();
    p1.name = 'A';
    p1.price = 'a';
    p1.percentage = 0.27;
    p1.color = Color(0xff82BAFF);

    pieData = p1;
    mData.add(p1);

    PieData p2 = new PieData();
    p2.name = 'B';
    p2.price = 'b';
    p2.percentage = 0.30;
    p2.color = Color(0xffFF9999);
    mData.add(p2);

    PieData p3 = new PieData();
    p3.name = 'C';
    p3.price = 'c';
    p3.percentage = 0.23;
    p3.color = Color(0xffFFC499);
    mData.add(p3);

    PieData p4 = new PieData();
    p4.name = 'D';
    p4.price = 'd';
    p4.percentage = 0.20;
    p4.color = Color(0xff6FE4FF);
    mData.add(p4);
  }
}

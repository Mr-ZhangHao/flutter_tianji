import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/course/routes/index.dart';
import 'package:flutter_tianji/course/widgets/banner3.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

//课程
class course_screen extends StatefulWidget {
  @override
  _course_screenState createState() => _course_screenState();
}

class _course_screenState extends State<course_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperBanner(),
            SizedBox(
              height: height(20),
            ),
            _Mycourse(),
            SizedBox(
              height: height(20),
            ),
            _course(),
            SizedBox(
              height: height(20),
            ),
            _Allcourse(),
            SizedBox(
              height: height(20),
            ),
          ],
        ),
      ),
    );
  }

  //我的课程
  _Mycourse() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // 底色
          boxShadow: [
            BoxShadow(
              blurRadius: width(4), //阴影范围
              spreadRadius: width(1), //阴影浓度
              color: Color(0xffF2EAF3), //阴影颜色
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.only(top: width(20)),
            child: Column(children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(left: width(30), right: width(30)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width(4),
                            height: height(28),
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: width(20),
                          ),
                          Expanded(
                            child: Text(
                              '我的课程',
                              style: TextStyle(
                                  color: Color(0xff323232),
                                  fontSize: sp(30),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '更多',
                            style: TextStyle(
                                color: Color(0xff909090), fontSize: sp(28)),
                          ),
                          SizedBox(
                            width: width(10),
                          ),
                          Image.asset(
                            'images/mine/next.png',
                            width: width(10),
                            height: height(17),
                            color: Color(0xffD1D1D1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height(20),
                      ),
                      Divider(
                        color: Color(0xffEAEAEA),
                        height: height(1),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  RouterUtil.push(context, CourseRouter.myCourseList);
                },
              ),
              Container(
                  width: double.maxFinite - 60,
                  height: height(300),
                  margin: EdgeInsets.only(
                      left: height(25),
                      right: width(25)),
                  child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        itemCount: 10,
                          shrinkWrap: true,
                          //设置水平方向排列
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              highlightColor: Colors.transparent,
                              radius: 0.0,
                              child: Container(
                                width: width(216),
                                height: height(280),
                                margin: EdgeInsets.only(
                                    top: height(30),
                                    right: width(20)),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'images/course/course_debug_bg2.png',
                                      fit: BoxFit.fill,
                                      width: width(216),
                                      height: height(140),
                                    ),
                                    SizedBox(
                                      height: height(15),
                                    ),
                                    Container(
                                      width: width(220),
                                      child: Text('${'手把手教你如何掌握买币……'}',
                                          maxLines: 2,
                                          style: TextStyle(fontSize: sp(24)),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Utils.normalText('看至25分钟',
                                          color: Color(0xffFF6D28), fontSize: 20,textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                              ),
                              onTap: (){
                                RouterUtil.push(context, CourseRouter.courseDetails);
                              },
                            ) ;
                          })))
            ])));
  }

  //优质课程
  _course() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // 底色
          boxShadow: [
            BoxShadow(
              blurRadius: width(4), //阴影范围
              spreadRadius: width(1), //阴影浓度
              color: Color(0xffF2EAF3), //阴影颜色
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.only(top: width(20)),
            child: Column(
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: width(30), right: width(30)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width(4),
                              height: height(28),
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: width(20),
                            ),
                            Expanded(
                              child: Text(
                                '优质课程',
                                style: TextStyle(
                                    color: Color(0xff323232),
                                    fontSize: sp(30),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            /*  Text(
                          '更多',
                          style:
                          TextStyle(color: Color(0xff909090), fontSize: sp(28)),
                        ),
                        SizedBox(
                          width: width(10),
                        ),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(10),
                          height: height(17),
                          color: Color(0xffD1D1D1),
                        ),*/
                          ],
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        Divider(
                          color: Color(0xffEAEAEA),
                          height: height(1),
                        )
                      ],
                    ),
                  ),
                  onTap: () {

                  },
                ),
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Container(
                    child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        //水平子Widget之间间距
                        crossAxisSpacing: width(15),
                        //垂直子Widget之间间距
                        mainAxisSpacing: width(15),
                        //GridView内边距
                        //一行的Widget数量
                        crossAxisCount: 2,
                        //子Widget宽高比例
                        childAspectRatio: 1.4,
                        //子Widget列表
                        children: getWidgetList()),
                    height: height(500),
                  ),
                )
              ],
            )));
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            'images/home/course_debug_bg.png',
            width: width(330),
            height: height(180),
          ),
          SizedBox(
            height: height(10),
          ),
          Container(
            width: width(330),
            child: Text('${'手把手教你如何掌握买币……'}',
                maxLines: 1,
                style: TextStyle(fontSize: sp(28)),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  //全部课程
  _Allcourse() {
    return Container(
        decoration: BoxDecoration(
          color: kWhite, // 底色
          boxShadow: [
            BoxShadow(
              blurRadius: width(4), //阴影范围
              spreadRadius: width(1), //阴影浓度
              color: Color(0xffF2EAF3), //阴影颜色
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.only(top: width(20)),
            child: Column(children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(left: width(30), right: width(30)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width(4),
                            height: height(28),
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: width(20),
                          ),
                          Expanded(
                            child: Text(
                              '全部课程',
                              style: TextStyle(
                                  color: Color(0xff323232),
                                  fontSize: sp(30),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                     /*     Text(
                            '更多',
                            style: TextStyle(
                                color: Color(0xff909090), fontSize: sp(28)),
                          ),
                          SizedBox(
                            width: width(10),
                          ),
                          Image.asset(
                            'images/mine/next.png',
                            width: width(10),
                            height: height(17),
                            color: Color(0xffD1D1D1),
                          ),*/
                        ],
                      ),
                      SizedBox(
                        height: height(20),
                      ),
                      Divider(
                        color: Color(0xffEAEAEA),
                        height: height(1),
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Container(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                  ),
                  child: GridView.count(
                    //水平子Widget之间间距
                    crossAxisSpacing: 5.0,
                    //垂直子Widget之间间距
                    mainAxisSpacing: 5.0,
                    //GridView内边距
                    padding: EdgeInsets.all(10.0),
                    //一行的Widget数量
                    crossAxisCount: 5,
                    shrinkWrap: true,
                    //子Widget宽高比例
                    childAspectRatio: 2.0,
                    //子Widget列表
                    children: getWidgetList2(),
           )),
              MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                          itemCount: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              highlightColor: Colors.transparent,
                              radius: 0.0,
                              child: Container(
                                  alignment: Alignment.center,
                                  width: double.maxFinite,
                                  height: height(290),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: width(1), color: Color(0xffEAEAEA)))),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(width: width(30),),
                                          Image.asset('images/home/project_debug_bg.png',fit: BoxFit.fill
                                            ,width: width(180),
                                            height: height(230),),
                                          Expanded(child:  ListTile(
                                            title:  Utils.normalText("区块链核心-密码与共识算法",
                                                textAlign: TextAlign.left),
                                            subtitle: Column(
                                              children: [
                                                Container(
                                                  width: double.maxFinite,
                                                  alignment: Alignment.centerLeft,
                                                  height: height(110),
                                                  child:  Text(
                                                    '分布式系统集群设计中面临着一个不可回避的问题，一致性问题。',
                                                    softWrap: true,
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize: sp(24),
                                                        color: Color(0xff646464)
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffE7E7E7),
                                                        borderRadius: BorderRadius.circular(width(25)),
                                                      ),
                                                      child: Utils.normalText('币币交易',fontSize: 20,color: Color(0xff2F6EFF)),
                                                      width: width(120),
                                                      alignment: Alignment.center,
                                                      height: height(42),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: height(10),),
                                                Row(
                                                  children: [
                                                    Image.network(
                                                      'https://i0.hdslb.com/bfs/archive/ea77044282a72e436b4e19a84737a17b0f7eb5e4.jpg@412w_232h_1c_100q.jpg',
                                                      width: width(32),
                                                      fit: BoxFit.fill,
                                                      height: height(32),
                                                    ),
                                                    SizedBox(width: width(10),),
                                                    Utils.normalText("吐司先生 优秀视频人，粉丝：3000W",
                                                        fontSize: 24,
                                                         textAlign: TextAlign.left),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),

                                    ],
                                  )
                              ),
                              onTap: () {

                              },
                            );
                          }))
            ])));
  }

  List dateList = [
    {"title": "全部", "id": 1},
    {"title": "币币交易", "id": 2},
    {"title": "法币交易", "id": 3}
  ];
  String title= '全部';

  List<Widget> getWidgetList2() {
    return dateList
        .map((e) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {
        setState(() {
          title = e['title'];
        //  widget.onCoinTab(coin);
        })
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: title == e['title'] ? kPrimaryColor:Color(0xffDDDDDD),
          borderRadius: BorderRadius.circular(4),
        ),
        height: width(50),
        width: width(120),
        child: Text(e['title'],
            style: TextStyle(
                color:
                title == e['title'] ? kWhite: Color(0xff323232),
                fontSize: sp(24))),
      ),
    ))
        .toList();
  }
}

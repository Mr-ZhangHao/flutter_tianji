import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/course/model/myCourseListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class myCourseListView extends PageList {
  @override
  _myCourseListViewState createState() => _myCourseListViewState();
}

class _myCourseListViewState extends PageListState<myCourseListModel, myCourseListView>  {

  List dateList = [
    {"title": "在看", "id": 1},
    {"title": "已看", "id": 2},
  ];
  String title= '在看';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: Utils.getCommonAppBar(context, '我的课程'),
      body: Container(
        child: Column(
          children: [
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
            Expanded(child: buildList(context))
          ],
        ),
      ),
      
    );
  }
  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  ///加载数据
  @override
  loadPage(
      {int page,
        Function(List<myCourseListModel>) onSuccess,
        Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
       var data = [myCourseListModel(), myCourseListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(myCourseListModel model) {
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
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff20FF6D28),
                                borderRadius: BorderRadius.circular(width(4)),
                              ),
                              child: Utils.normalText('币币交易',fontSize: 20,color: Color(0xffFF6D28)),
                              width: width(140),
                              alignment: Alignment.center,
                              height: height(42),
                            ),
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
  }

  @override
  empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/business/no_task.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text('${Tr.of(context).homeNodata}',
              style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }
}

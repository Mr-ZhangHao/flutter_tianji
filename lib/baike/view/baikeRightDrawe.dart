import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_seekbar/seekbar/section_text_model.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';
import 'package:flutter_tianji/baike/model/screenTypeModel.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/drawer/index.dart';
import 'package:flutter_tianji/common/event/projectListEvent.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:provider/provider.dart';

class baikeRightDrawe extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>> onTab;

  const baikeRightDrawe({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  _baikeRightDraweState createState() => _baikeRightDraweState();
}

class _baikeRightDraweState extends State<baikeRightDrawe> {
  // List list = ['全部', '区块链', '流动性矿'];
  String selectPayType = '';
  Map<String, dynamic> map = {
/*    "id": cateList[i].id,
    "name": cateList[i].name,*/
  };
  List<SectionTextModel> sectionTextsGreen = [
     SectionTextModel(position: 0, text: 'C', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 1, text: 'C+', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 2, text: 'B', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 3, text: 'B+', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 4, text: 'A', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 5, text: 'A+', progressColor: Color(0xffCBC4FF)),
  ];
  int id;
  double level = 1;
  List<Cate> cateList;
  List<String> levelList;

  @override
  void initState() {
    super.initState();
    // cateList =  Provider.of<baikeProvider>(context, listen: false).cateList;
    // levelList = Provider.of<baikeProvider>(context, listen: false).levelList;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Scaffold(
        body: Consumer<baikeProvider>(
            builder: (BuildContext context, baikeProvider model, Widget child) {
          return Stack(
            children: <Widget>[
              _headerView(model),
              _footerView(),
            ],
          );
        }),
      ),
    );
  }

  Widget _headerView(baikeProvider model) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height(30),
          ),
          Container(
            margin: EdgeInsets.only(top: height(20), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              '评级',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
       /*    Container(
            margin: EdgeInsets.only(
                right: width(40), left: width(40), top: height(30)),
            child: SeekBar(
                progresseight: 1,
                value: double.parse(level.toString()),
                sectionCount: int.parse(model.sectionTextsGreen.length.toString())-1,
                isCanTouch: true,
                sectionRadius: 6,
                bubbleRadius: 10,
                min: 1,
                max: double.parse(model.sectionTextsGreen.length.toString()),
                indicatorRadius: 10,
                showSectionText: true,
                indicatorColor: Color(0xffCBC4FF),
                afterDragShowSectionText: false,
                sectionTexts: model.sectionTextsGreen,
                sectionTextSize: sp(18),
                sectionTextColor: kTxtColor,
                sectionSelectTextColor: Color(0xffCBC4FF),
                sectionTextMarginTop: height(10),
                backgroundColor: Color(0xffEBEBEB),
                sectionUnSelecteColor: Color(0xffEBEBEB),
                progressColor: Color(0xffEBEBEB),
                sectionColor: Color(0xffCBC4FF),
                onValueChanged: (v) {
                  print("v:"+v.toString());
                  setState(() {
                   // level = v;
                    var a = {
                      "level": level,
                    };
                    map.addAll(a);
                  });
                }),
          ),*/
          Container(
            margin: EdgeInsets.only(
                right: width(80), left: width(40), top: height(30)),
            child: SeekBar(
                progresseight: 1,
                value: level,
                sectionCount: int.parse(model.sectionTextsGreen.length.toString())-1,
                isCanTouch: true,
                sectionRadius: 5,
                bubbleRadius: 8,
                min: 1,
                max: double.parse(model.sectionTextsGreen.length.toString())-1,
                indicatorRadius: 8,
                showSectionText: true,
                indicatorColor: Color(0xffCBC4FF),
                afterDragShowSectionText: false,
                sectionTexts:  model.sectionTextsGreen,
                sectionTextSize: sp(18),
                sectionTextColor: kTextColor3,
                sectionSelectTextColor: Color(0xffCBC4FF),
                sectionTextMarginTop: height(10),
                backgroundColor: Color(0xffEBEBEB),
                sectionUnSelecteColor: Color(0xffEBEBEB),
                progressColor: Color(0xffEBEBEB),
                sectionColor: Color(0xffCBC4FF),
                onValueChanged: (v) {
                  print("v:"+v.toString());
                   level = v.value;
                  var a = {
                    "level": level,
                  };
                  map.addAll(a);
                }),
          ),
          SizedBox(
            height: height(30),
          ),
          Container(
            margin: EdgeInsets.only(top: height(20), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              '类型',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          Expanded(
              child: GridView.count(
            //水平子Widget之间间距
            crossAxisSpacing: 5.0,
            //垂直子Widget之间间距
            mainAxisSpacing: 5.0,
            //GridView内边距
            padding: EdgeInsets.all(10.0),
            //一行的Widget数量
            crossAxisCount: 3,
            //子Widget宽高比例
            childAspectRatio: 2.0,
            //子Widget列表
            children: model.list
                .map((e) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        setState(() {
                          selectPayType = e['name'];
                          id = e['id'];
                          var a = {
                            "id": id,
                            "name": selectPayType,
                          };
                          map.addAll(a);
                        })
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: height(20)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectPayType == e['name'] ? kPrimaryColor:kWhite,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xffE0E0E0),width: selectPayType == e['name'] ? 0:0.5),
                        ),
                        height: width(60),
                        width: width(140),
                        child: Text(e['name'],
                            style: TextStyle(
                                color: selectPayType == e['name']
                                    ? kWhite
                                    : Color(0xff323232),
                                fontSize: sp(24))),
                      ),
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }

  Widget _footerView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: height(90),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: width(1), color: Color(0xffD3D3D3)),
          ),
        ),
        child: Row(children: <Widget>[
          Expanded(
            child: SmallButton(
              color: kTransprant,
              textColor: kPrimaryColor,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).TradrReset}',
              onPressed: () {
                setState(() {

                  var a = {
                    "id": 0,
                    "name": '',
                  };
                  map.addAll(a);
                  widget.onTab(map);
                  Navigator.of(context).pop();
                  // currencyModel2 = currencyModel;
                });
              },
            ),
          ),
          Expanded(
            child: SmallButton(
              color: kPrimaryColor,
              textColor: Colors.white,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).Confirm}',
              onPressed: () {
                // widget.onTab(selectPayType);
                widget.onTab(map);
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
      ),
    );
  }

/*   List<Widget> getWidgetList() {
    return list.map((e) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => {
            setState(() {
              list = e;
            })
          },
          child: Container(
            margin: EdgeInsets.only(top: height(20)),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xffEFF8FE),
                borderRadius: BorderRadius.circular(5),
                image: currencyModel2.currency == e.currency
                    ? DecorationImage(
                        image: AssetImage('images/trade/select.png'),
                        fit: BoxFit.fill)
                    : null),
            height: width(70),
            width: width(140),
            child: Text(e.currency,
                style: TextStyle(
                    color: currencyModel2.currency == e.currency
                        ? kPrimaryColor
                        : Color(0xff323232),
                    fontSize: sp(24))),
          ),
        )).toList();
  } */

}

import 'package:flutter/material.dart';
import 'package:flutter_seekbar/seekbar/section_text_model.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/drawer/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/utils/screen.dart';

class baikeRightDrawe extends StatefulWidget {
  final ValueChanged<List<String>> onTab;
  const baikeRightDrawe({
    Key key,
    
    this.selectPayType,
    this.onTab,
  }) : super(key: key);
  final String selectPayType;
  @override
  _baikeRightDraweState createState() => _baikeRightDraweState();
}

class _baikeRightDraweState extends State<baikeRightDrawe> {
  List list = ['全部', '区块链', '流动性矿'];
  String selectPayType;

  List<SectionTextModel> sectionTextsGreen = [
    SectionTextModel(position: 0, text: 'C', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 1, text: 'C+', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 2, text: 'B', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 3, text: 'B+', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 4, text: 'A', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 5, text: 'A+', progressColor: Color(0xffCBC4FF)),
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      selectPayType = widget.selectPayType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _headerView(),
            _footerView(),
          ],
        ),
      ),
    );
  }

  Widget _headerView() {
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
          Container(
            margin: EdgeInsets.only(
                right: width(40), left: width(40), top: height(30)),
            child: SeekBar(
                progresseight: 1,
                value: 2,
                sectionCount: 5,
                isCanTouch: true,
                sectionRadius: 6,
                bubbleRadius: 10,
                min: 1,
                max: 6,
                indicatorRadius: 10,
                showSectionText: true,
                indicatorColor: Color(0xffCBC4FF),
                afterDragShowSectionText: false,
                sectionTexts: sectionTextsGreen,
                sectionTextSize: sp(18),
                sectionTextColor: kTxtColor,
                sectionSelectTextColor: Color(0xffCBC4FF),
                sectionTextMarginTop: height(10),
                backgroundColor: Color(0xffEBEBEB),
                sectionUnSelecteColor: Color(0xffEBEBEB),
                progressColor: Color(0xffEBEBEB),
                sectionColor: Color(0xffCBC4FF),
                onValueChanged: (v) {}),
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
            children: list
                .map((e) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        setState(() {
                          selectPayType = e;
                        })
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: height(20)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffEFF8FE),
                            borderRadius: BorderRadius.circular(5),
                            image: selectPayType == e
                                ? DecorationImage(
                                    image:
                                        AssetImage('images/baike/select.png'),
                                    fit: BoxFit.fill)
                                : null),
                        height: width(70),
                        width: width(140),
                        child: Text(e,
                            style: TextStyle(
                                color: selectPayType == e
                                    ? kPrimaryColor
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
              text: '${Tr.of(context).cancel}',
              onPressed: () {
                setState(() {
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

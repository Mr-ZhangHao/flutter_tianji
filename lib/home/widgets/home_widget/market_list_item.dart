import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';

class MarketListItem extends StatelessWidget {
  final String symbol;
  final double price;
  final double rate;
  final double volum;
  final double amount;
  const MarketListItem({
    Key key,
    @required this.symbol,
    @required this.price,
    @required this.rate,
    @required this.volum,
    @required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styleBig = TextStyle(
      color: kTextColor3,
    );

    List<SectionTextModel> sectionTextsGreen = [
      SectionTextModel(
          position: 0, text: '阶1', progressColor: Color(0xffFEA665)),
      SectionTextModel(
          position: 1, text: '阶2', progressColor: Color(0xffFEA665)),
      SectionTextModel(
          position: 2, text: '阶3', progressColor: Color(0xffFEA665)),
      SectionTextModel(
          position: 3, text: '阶4', progressColor: Color(0xffFEA665)),
      SectionTextModel(
          position: 4, text: '阶5', progressColor: Color(0xffFEA665)),
    ];
    TextStyle styleSm = TextStyle(fontSize: sp(20), color: kBlack);
    return Container(
        padding: EdgeInsets.symmetric(vertical: height(20)),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.5, color: kDividerColor))),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Image.asset('images/home/icon_quantify.png',
                        width: width(48), height: height(48)),
                    SizedBox(
                      width: height(10),
                    ),
                    Text('海马量化',
                        style: TextStyle(
                            fontSize: sp(28),
                            color: kBlack,
                            fontWeight: FontWeight.bold))
                  ],
                )),
                Text('海马量化介绍推荐由文',
                    style:
                        TextStyle(fontSize: sp(24), color: Color(0xffCFCFCF))),
                SizedBox(
                  width: height(10),
                ),
                Image.asset('images/home/right.png',
                    width: width(10), height: height(18)),
              ],
            ),
            SizedBox(
              height: height(20),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: width(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("级别", style: styleBig),
                      SizedBox(
                        height: height(15),
                      ),
                      Text('A',
                          style: TextStyle(
                              fontSize: sp(56),
                              color: kBlack,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: width(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("项目周期", style: styleBig),
                      SizedBox(
                        height: height(15),
                      ),
                      Container(
                        child: SeekBar(
                            progresseight: 1,
                            value: 2,
                            sectionCount: 4,
                            isCanTouch: false,
                            sectionRadius: 3,
                            bubbleRadius: 2,
                            min: 1,
                            max: 5,
                            indicatorRadius: 4,
                            showSectionText: true,
                            indicatorColor: Color(0xffFEA665),
                            afterDragShowSectionText: false,
                            sectionTexts: sectionTextsGreen,
                            sectionTextSize: sp(18),
                            sectionTextColor: kTxtColor,
                            sectionSelectTextColor: Color(0xffFEA665),
                            sectionTextMarginTop: height(10),
                            backgroundColor: Color(0xffEBEBEB),
                            sectionUnSelecteColor: Color(0xffEBEBEB),
                            progressColor: Color(0xffEBEBEB),
                            sectionColor: Color(0xffFEA665),
                            onValueChanged: (v) {}),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: width(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("相关资讯", style: styleBig),
                      SizedBox(
                        height: height(15),
                      ),
                      Container(
                        width: width(70),
                        height: height(34),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff377865FE),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Text('${amount}',
                            style: TextStyle(
                                fontSize: sp(20), color: kPrimaryColor)),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ],
        ));
  }
}

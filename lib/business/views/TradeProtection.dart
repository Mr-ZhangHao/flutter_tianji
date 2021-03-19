import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/model/TradeProtectionModel.dart';
import 'package:flutter_tianji/business/routes/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 交易防护 */
class TradeProtectionPage extends StatefulWidget {
  @override
  _TradeProtectionPageState createState() => _TradeProtectionPageState();
}

class _TradeProtectionPageState extends State<TradeProtectionPage> {
  bool isTask = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getCommonAppBar(context, "交易防护", elevation: 1.0, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Icon(
                Icons.add,
                color: kPrimaryColor,
                size: 20,
              ),
              onTap: () {
                RouterUtil.push(context, BusinessRouter.CreateProtective);
              },
            ),
            SizedBox(
              width: width(30),
            ),
          ],
        ),
      ]),
      body: isTask
          ? TradeProtectionListView()
          : Center(
              child: Column(
                children: [
                  SizedBox(height: height(200)),
                  Image.asset(
                    'images/business/no_data.png',
                    fit: BoxFit.fitWidth,
                    width: width(230),
                    height: height(150),
                  ),
                  SizedBox(height: height(12)),
                  Utils.normalText(
                    '无交易防护',
                  ),
                  SizedBox(height: height(42)),
                  Container(
                    width: width(200),
                    height: height(80),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: Color(0xFF7865FE), // 底色
                      borderRadius: new BorderRadius.circular(width(8)), // 圆角度
                    ),
                    child: GestureDetector(
                      child: Center(
                        child: Text("创建",
                            style: TextStyle(fontSize: sp(28), color: kWhite)),
                      ),
                      onTap: () {
                        RouterUtil.push(
                            context, BusinessRouter.CreateProtective);
                      },
                    ),
                  ),
                  SizedBox(height: height(142)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width(20)),
                    child:
                        Utils.normalText('什么是交易防护？', textAlign: TextAlign.left),
                  ),
                  SizedBox(height: height(20)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width(20)),
                    child: Utils.normalText(
                        '当转出金额≥防护触发金额时，触发交易防护，那么这笔交易会先进入交易审核，不会直接交易成功。',
                        textAlign: TextAlign.left),
                  )
                ],
              ),
            ),
    );
  }
}

/* 交易防护列表 */
class TradeProtectionListView extends PageList {
  TradeProtectionListView({Key key}) : super(key: key);

  @override
  _TradeProtectionListViewState createState() =>
      _TradeProtectionListViewState();
}

class _TradeProtectionListViewState
    extends PageListState<TradeProtectionModel, TradeProtectionListView> {
  bool flag = false;

  set data(List<TradeProtectionModel> data) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
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
      Function(List<TradeProtectionModel>) onSuccess,
      Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      var data = [TradeProtectionModel(), TradeProtectionModel()];

      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(
    TradeProtectionModel model,
  ) {
    return Card(
        child: Container(
      height: height(260),
      padding: EdgeInsets.only(left: width(20), right: width(20)),
      margin: EdgeInsets.only(top: height(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/home/icon_quantify.png',
                      width: width(40), height: height(40)),
                  SizedBox(
                    width: height(20),
                  ),
                  Text('BTC',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xff604F6A))),
                ],
              )),
              Container(
                child: CupertinoSwitch(
                  activeColor: Color(0xff7865FE),
                  value: this.flag,
                  onChanged: (bool value) {
                    setState(() {
                      this.flag = value;
                    });
                  },
                ),
                width: width(96),
                height: height(48),
              )
            ],
          ),
          SizedBox(
            height: height(30),
          ),
          Row(
            children: [
              Expanded(
                child: Text('防护金额',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: sp(28), color: kPrimaryColor)),
              ),
              Text('>= 0.01  BTC',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: sp(28), color: kPrimaryColor)),
            ],
          ),
          SizedBox(
            height: height(30),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: kDividerColor))),
          ),
          SizedBox(
            height: height(20),
          ),
          Row(
            children: [
              Expanded(
                child: Text('2020-10-27 14:29 创建',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: sp(28), color: Color(0xff9f9f9f))),
              ),
              GestureDetector(
                child: Image.asset(
                  'images/business/icon_delet.png',
                  width: width(36),
                  height: height(36),
                  color: Color(0xff323232),
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    ));
  }

  @override
  empty() {
    return SizedBox();
  }
}

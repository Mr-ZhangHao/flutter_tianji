import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/drawer/index.dart';
import 'package:flutter_tianji/common/event/allStartegyEvent.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:provider/provider.dart';

class StrategyRightDrawer extends StatefulWidget {
  final ValueChanged<List<String>> onTab;
  final String coinID;
  final String mPlatformId;
  final Function(String coin) onCoinTab;
  final Function(String Platform) onPlatformTab;
  const StrategyRightDrawer({
    Key key,
    this.onTab,
    this.coinID,
    this.onCoinTab,
    this.mPlatformId,
    this.onPlatformTab,
  }) : super(key: key);
  @override
  _screenRightDrawerState createState() => _screenRightDrawerState();
}

class _screenRightDrawerState extends State<StrategyRightDrawer> {
  List<String> selectPayType;
  bool flag = false;
  bool flag2 = false;
  final _addressCtr = TextEditingController();
  final FocusNode _addressFocus = FocusNode();
  String coin = "";
  String mPlatform = "";
  String mPlatformID = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      coin = widget.coinID;
      mPlatform = widget.mPlatformId;
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
        padding: EdgeInsets.only(top: height(100), left: width(40)),
        color: Colors.white,
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '交易币种',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          SizedBox(
            height: height(30),
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
                crossAxisCount: 3,
                //子Widget宽高比例
                childAspectRatio: 2.0,
                //子Widget列表
                children: getWidgetList(),
              )),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '交易平台',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          SizedBox(
            height: height(30),
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
            children: getWidgetList2(),
          ))
        ]));
  }

  List<Widget> getWidgetList2() {
    return Provider.of<StrategyProvider>(context, listen: false)
        .platformsList
        .map((e) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => {
                setState(() {
                  mPlatform = e.platform;
                  mPlatformID = e.id.toString();
                  widget.onPlatformTab(mPlatform);
                })
              },
              child: Container(
                margin: EdgeInsets.only(top: height(20)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffEFF8FE),
                    borderRadius: BorderRadius.circular(5),
                    image: mPlatform == e.platform
                        ? DecorationImage(
                            image: AssetImage('images/wallet/select.png'),
                            fit: BoxFit.fill)
                        : null),
                height: width(70),
                width: width(140),
                child: Text(e.platform,
                    style: TextStyle(
                        color: mPlatform == e.platform
                            ? kPrimaryColor
                            : Color(0xff323232),
                        fontSize: sp(24))),
              ),
            ))
        .toList();
  }

  List<Widget> getWidgetList() {
    return Provider.of<StrategyProvider>(context, listen: false)
        .coinsList
        .map((e) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => {
                setState(() {
                  coin = e.coin;
                  widget.onCoinTab(coin);
                })
              },
              child: Container(
                margin: EdgeInsets.only(top: height(20)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffEFF8FE),
                    borderRadius: BorderRadius.circular(5),
                    image: coin == e.coin
                        ? DecorationImage(
                            image: AssetImage('images/wallet/select.png'),
                            fit: BoxFit.fill)
                        : null),
                height: width(70),
                width: width(140),
                child: Text(e.coin,
                    style: TextStyle(
                        color:
                            coin == e.coin ? kPrimaryColor : Color(0xff323232),
                        fontSize: sp(24))),
              ),
            ))
        .toList();
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
                  coin = "";
                  mPlatform = "";
                  Application.eventBus
                      .fire(allStartegyEvent(coin, mPlatformID));
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
                //  widget.onTab(mPlatform);
                Application.eventBus.fire(allStartegyEvent(coin, mPlatformID));
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
      ),
    );
  }
}

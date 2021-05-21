import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/utils/screen.dart';

class SearchCoinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchCoinPageState();
  }
}

class _SearchCoinPageState extends State<SearchCoinPage> {
  final _searchCtr = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  final List<String> dataList = [
    'BTC',
    'USDT',
    'LTC',
    'ETH',
    'TBR',
    'ADS',
    'TCH'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: TextFileWidget(
          focus: _searchFocus,
          controller: _searchCtr,
          onTab: () {
            print(_searchCtr.text);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            HotSearchWidget(
              dataList: dataList,
              onTab: (val) {
                print(val);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length + 1,
                itemBuilder: (context, index) {
                  if (index < dataList.length) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {print('跳到币的详情${dataList[index]}')},
                      child: CoinListItem(text: dataList[index]),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () => {print('清除历史记录')},
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: height(40)),
                        alignment: Alignment.center,
                        child: Text(
                          '清除历史记录',
                          style: TextStyle(
                              fontSize: sp(24), color: Color(0xff999999)),
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CoinListItem extends StatelessWidget {
  final String text;
  const CoinListItem({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(100),
      margin: EdgeInsets.symmetric(horizontal: width(44)),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffDDDDDD)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Color(0xff333333), fontSize: sp(28)),
          ),
          Image.asset(
            'images/home/fx.png',
            height: height(22),
            width: width(22),
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}

class HotSearchWidget extends StatelessWidget {
  final List<String> dataList;
  final Function(String) onTab;
  const HotSearchWidget({
    Key key,
    @required this.dataList,
    @required this.onTab,
  }) : super(key: key);
// Text('热门搜索'),
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: width(30), top: height(20), bottom: height(24)),
          alignment: Alignment.centerLeft,
          child: Text('热门搜索',
              style: TextStyle(color: Color(0xff999999), fontSize: sp(24))),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            constraints: BoxConstraints(
              minHeight: height(100),
              maxHeight: height(200),
            ),
            child: GridView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => onTab(dataList[index]),
                  child: HotItem(text: dataList[index]),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //水平单个子Widget之间间距
                  mainAxisSpacing: height(20),
                  //垂直单个子Widget之间间距
                  crossAxisSpacing: width(10),
                  childAspectRatio: 4.5),
            ))
      ],
    );
  }
}

class HotItem extends StatelessWidget {
  final String text;
  const HotItem({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffEBEBEB),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(text,
          style: TextStyle(color: Color(0xff666666), fontSize: sp(24))),
    );
  }
}

///搜索控件widget
class TextFileWidget extends StatelessWidget {
  final FocusNode focus;
  final TextEditingController controller;
  final Function onTab;
  const TextFileWidget({
    Key key,
    this.focus,
    this.controller,
    @required this.onTab,
  }) : super(key: key);

  Widget buildTextField() {
    //theme设置局部主题
    return FocusWidget(
      focusNode: focus,
      child: TextField(
        controller: controller,
        focusNode: focus,
        cursorColor: Color(0xffc2c2c2), //设置光标
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: height(18)),
            fillColor: Colors.white,
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Color(0xffC2C2C2), size: sp(44)),
            hintText: "请输入币种名称",
            hintStyle: TextStyle(fontSize: sp(28), color: Color(0xffc2c2c2))),
        style: TextStyle(fontSize: sp(28), color: Color(0xff323232)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.5), //灰色的一层边框
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 1),
                  color: Color(0xffCDCDCD),
                  blurRadius: 5.0,
                  spreadRadius: -1)
            ]),
        alignment: Alignment.center,
        height: height(60),
        child: buildTextField(),
      );
    }

    var cancleView =
        Text("搜索", style: TextStyle(color: kPrimaryColor, fontSize: sp(28)));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: editView(),
          flex: 1,
        ),
        GestureDetector(
          onTap: onTab,
          child: Padding(
            padding: EdgeInsets.only(left: width(30)),
            child: cancleView,
          ),
        )
      ],
    );
  }
}

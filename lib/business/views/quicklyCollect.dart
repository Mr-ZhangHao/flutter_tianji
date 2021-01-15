import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 一键归集 */
class quicklyCollectPage extends StatefulWidget {
  @override
  _quicklyCollectPageState createState() => _quicklyCollectPageState();
}

class _quicklyCollectPageState extends State<quicklyCollectPage> {
  final _AmountPswCtr = TextEditingController();
  final FocusNode _AmountFocus = FocusNode();

  final _AddressCtr = TextEditingController();
  final FocusNode _AddressFocus = FocusNode();
  final _AddressCtr2 = TextEditingController();
  final FocusNode _AddressFocus2 = FocusNode();

  final _CoinCtr = TextEditingController();
  final FocusNode _CoinFocus = FocusNode();

  final _switchCtr = TextEditingController();
  final FocusNode _switchFocus = FocusNode();

  final _LimitCtr = TextEditingController();
  final FocusNode _LimitFocus = FocusNode();

  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Utils.getCommonAppBar(context, "一键归集", elevation: 1.0),
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: width(35)),
          child: Column(
            children: [
              FocusWidget(
                focusNode: _CoinFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.right,
                  focusNode: _CoinFocus,
                  onTab: () {},
                  controller: _CoinCtr,
                  prefixIconConstraintsMaxWidth: 350,
                  prefixIconConstraintsMinWidth: 150,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxWidth: 250,
                  suffixIconConstraintsMinHeight: 50,
                  suffixIconConstraintsMinWidth: 150,
                  readOnly: true,
                  suffixIcon: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('ETH',
                            style: TextStyle(
                                color: Color(0xff323232), fontSize: sp(28))),
                        SizedBox(width: width(10)),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(18),
                          color: Color(0xff323232),
                        ),
                      ],
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: height(5)),
                  hintStyle:
                      TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('选择币种',
                        style: TextStyle(
                            color: Color(0xff323232), fontSize: sp(28))),
                  ),
                  hintText: null,
                ),
              ),
              FocusWidget(
                focusNode: _AddressFocus,
                child: InputWidget(
                  maxHeight: 100,
                  focusNode: _AddressFocus,
                  hintText: '填写归集地址',
                  obscureText: true,
                  controller: _AddressCtr,
                  suffixIconConstraintsMaxWidth: 40,
                  suffixIconConstraintsMinWidth: 40,
                  suffixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxWidth: 350,
                  prefixIconConstraintsMinWidth: 150,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('归集地址：',
                        style: TextStyle(
                            color: Color(0xff323232), fontSize: sp(28))),
                  ),
                  suffixIcon: Image.asset(
                    'images/business/sao@2x.png',
                    width: width(40),
                    height: height(40),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _LimitFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.right,
                  focusNode: _LimitFocus,
                  onTab: () {},
                  controller: _LimitCtr,
                  prefixIconConstraintsMaxWidth: 350,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxWidth: 250,
                  suffixIconConstraintsMinHeight: 50,
                  suffixIconConstraintsMinWidth: 150,
                  readOnly: true,
                  suffixIcon: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('0.00000000',
                            style: TextStyle(
                                color: Color(0xff323232), fontSize: sp(28))),
                      ],
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: height(5)),
                  hintStyle:
                      TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('归集限额：',
                        style: TextStyle(
                            color: Color(0xff323232), fontSize: sp(28))),
                  ),
                  hintText: null,
                ),
              ),
              FocusWidget(
                focusNode: _AddressFocus2,
                child: InputWidget(
                  maxHeight: 100,
                  focusNode: _AddressFocus2,
                  hintText: '填写矿工费地址',
                  obscureText: true,
                  controller: _AddressCtr2,
                  suffixIconConstraintsMaxWidth: 40,
                  suffixIconConstraintsMinWidth: 40,
                  suffixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Utils.normalText('矿工费地址：'),
                  suffixIcon: Image.asset(
                    'images/business/sao@2x.png',
                    width: width(40),
                    height: height(40),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _switchFocus,
                child: InputWidget(
                  maxHeight: 100,
                  focusNode: _switchFocus,
                  readOnly: true,
                  controller: _switchCtr,
                  suffixIconConstraintsMaxWidth: 200,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxWidth: 250,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  prefixIcon: Container(
                    child: Text('状态',
                        style: TextStyle(
                            color: Color(0xff323232), fontSize: sp(28))),
                  ),
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  suffixIcon: CupertinoSwitch(
                    activeColor: Color(0xff7865FE),
                    value: this.flag,
                    onChanged: (bool value) {
                      setState(() {
                        this.flag = value;
                      });
                    },
                  ),
                  hintText: null,
                ),
              ),
              SizedBox(
                height: height(150),
              ),
              MyButton(
                circular: width(60),
                text: '创建',
                // onPressed: () {},
              ),
            ],
          ),
        )));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/drawer/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class screenRightDrawer extends StatefulWidget {
  final ValueChanged<List<String>> onTab;
  const screenRightDrawer({
    Key key,
    this.onTab,
  }) : super(key: key);
  @override
  _screenRightDrawerState createState() => _screenRightDrawerState();
}

class _screenRightDrawerState extends State<screenRightDrawer> {
  List<String> selectPayType;
  bool flag = false;
  bool flag2 = false;
  final _addressCtr = TextEditingController();
  final FocusNode _addressFocus = FocusNode();
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
              '地址',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          SizedBox(
            height: height(30),
          ),
          Container(
            height: height(74),
            child: Row(
              children: [
                Container(
                  width: width(350),
                  child: TextField(
                      textAlign: TextAlign.left,
                      controller: _addressCtr,
                      autofocus: false,
                      style:
                          TextStyle(fontSize: sp(26), color: Color(0xff323232)),
                      focusNode: _addressFocus,

                      /// 设置输入框样式
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                            Radius.circular(width(10)),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                            Radius.circular(width(10)),
                          ),
                        ),
                        hintText: '填写归集地址',
                        hintStyle: TextStyle(
                            fontSize: sp(26), color: Color(0xffcccccc)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: width(20)),
                      )),
                ),
                SizedBox(
                  width: width(20),
                ),
                GestureDetector(
                  child: Image.asset(
                    'images/business/sao@2x.png',
                    width: width(40),
                    height: height(40),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: height(30),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '创建时间',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          SizedBox(
            height: height(30),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                    child: InputWidget(
                  textAlign: TextAlign.center,
                  controller: null,
                  focusNode: null,
                  hintText: '开始日期',
                  readOnly: true,
                  onTab: () {},
                )),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: Color(0xff9D9D9D),
                  ),
                  width: width(60),
                  height: height(40),
                ),
                Expanded(
                    child: InputWidget(
                  textAlign: TextAlign.center,
                  controller: null,
                  focusNode: null,
                  hintText: '结束日期',
                  readOnly: true,
                  onTab: () {},
                )),
              ],
            ),
          ),
          SizedBox(
            height: height(30),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '可用余额  ≥',
                  style: TextStyle(fontSize: sp(30)),
                ),
              ),
              SizedBox(
                width: width(30),
              ),
              Container(
                width: width(318),
                child: TextField(
                    textAlign: TextAlign.left,
                    controller: _addressCtr,
                    autofocus: false,
                    style:
                        TextStyle(fontSize: sp(26), color: Color(0xff323232)),
                    focusNode: _addressFocus,

                    /// 设置输入框样式
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                          Radius.circular(width(10)),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                          Radius.circular(width(10)),
                        ),
                      ),
                      hintText: '0.00',
                      hintStyle:
                          TextStyle(fontSize: sp(26), color: Color(0xffcccccc)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width(20)),
                    )),
              )
            ],
          ),
          SizedBox(
            height: height(30),
          ),
          Row(
            children: [
              Utils.normalText('归集状态'),
              SizedBox(
                width: width(30),
              ),
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
              Utils.normalText('状态'),
              SizedBox(
                width: width(30),
              ),
              Container(
                child: CupertinoSwitch(
                  activeColor: Color(0xff7865FE),
                  value: this.flag2,
                  onChanged: (bool value) {
                    setState(() {
                      this.flag2 = value;
                    });
                  },
                ),
                width: width(96),
                height: height(48),
              )
            ],
          )
        ]));
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
                widget.onTab(selectPayType);
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
      ),
    );
  }
}

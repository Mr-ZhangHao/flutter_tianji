import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/input/text_input2.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/utils/screen.dart';

class Forgot2PageWidget extends StatefulWidget {

  const Forgot2PageWidget({
    Key key,
  }) : super(key: key);

  @override
  _Forgot2PageWidgetState createState() => _Forgot2PageWidgetState();
}

class _Forgot2PageWidgetState extends State<Forgot2PageWidget> {

  final _psw1Ctr = TextEditingController();
  final FocusNode _psw1Focus = FocusNode();
  final _psw2Ctr = TextEditingController();
  final FocusNode _psw2Focus = FocusNode();
  final _InvitationCodeCtr = TextEditingController();
  final FocusNode _InvitationCodeFocus = FocusNode();
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text(''),
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width(DefaultPadding)),
            child: Column(
              children: [
                SizedBox(height: height(48)),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    '找回密码',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: sp(48),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: height(20)),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                  ),
                  child: Text(
                    '登录密码6-20位，且为数字字母组合',
                    style: TextStyle(
                        color:Color(0xffB7B7B7),
                        fontSize: sp(28),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: height(30)),

                Container(
                  height: height(88),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: width(40)),
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(circular),
                        bottomRight: Radius.circular(circular),
                        topLeft: Radius.circular(circular),
                        topRight: Radius.circular(circular),
                      )),
                  child:       FocusWidget(
                    focusNode: _psw1Focus,
                    child:  InputWidget2(
                      obscureText: true,
                      controller: _psw1Ctr,
                      focusNode: _psw1Focus,
                      hintText: '设置新密码',
                      suffixIconConstraintsMaxWidth: 160,
                      suffixIconConstraintsMinWidth: 160,
                      suffixIconConstraintsMaxHeight: 60,
                      suffixIconConstraintsMinHeight: 60,
                      maxHeight: 100,
                    ),
                  ),
                ),
                SizedBox(height: height(20)),
                Container(
                  height: height(88),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: width(40)),
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(circular),
                        bottomRight: Radius.circular(circular),
                        topLeft: Radius.circular(circular),
                        topRight: Radius.circular(circular),
                      )),
                  child:       FocusWidget(
                    focusNode: _psw2Focus,
                    child:  InputWidget2(
                      obscureText: true,
                      controller: _psw2Ctr,
                      focusNode: _psw2Focus,
                      hintText: '请再次输入新密码',
                      suffixIconConstraintsMaxWidth: 160,
                      suffixIconConstraintsMinWidth: 160,
                      suffixIconConstraintsMaxHeight: 60,
                      suffixIconConstraintsMinHeight: 60,
                      maxHeight: 100,
                    ),
                  ),
                ),
                SizedBox(height: height(20)),
                Container(
                  height: height(88),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: width(40)),
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(circular),
                        bottomRight: Radius.circular(circular),
                        topLeft: Radius.circular(circular),
                        topRight: Radius.circular(circular),
                      )),
                  child: FocusWidget(
                    focusNode: _codeFocus,
                    child: InputWidget2(
                      obscureText: true,
                      controller: _codeCtr,
                      focusNode: _codeFocus,
                      hintText: '请输入验证',
                      getVCode: () {
                        return Future.value(true);
                      },
                      suffixIconConstraintsMaxWidth: 160,
                      suffixIconConstraintsMinWidth: 160,
                      suffixIconConstraintsMaxHeight: 60,
                      suffixIconConstraintsMinHeight: 60,
                      maxHeight: 100,
                    ),
                  ),
                ),
                SizedBox(height: height(30)),
                GestureDetector(
                  /*       onTap: () =>
                      RouterUtil.push(context, LoginRouter.setpwd,
                          replace: true, clearStack: false),*/
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: height(36)),
                    height: height(88),
                    decoration: BoxDecoration(
                      color: Color(0xff7865FE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(circular),
                        bottomRight: Radius.circular(circular),
                        topLeft: Radius.circular(circular),
                        topRight: Radius.circular(circular),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '确定',
                      style: TextStyle(color: Colors.white, fontSize: sp(28)),
                    ),
                  ),
                ),

              ],

            ),
          )
      ),

    );
  }
}

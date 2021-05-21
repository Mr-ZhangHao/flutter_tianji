import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/input/text_input2.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/login/server/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/routes/routes.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class Forgot2PageWidget extends StatefulWidget {
  final String account;
  const Forgot2PageWidget({Key key, this.account}) : super(key: key);

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

  bool isopen = false;
  bool isopen2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: Utils.getCommonAppBar(context, '${Tr.of(context).FindPassword}'),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: width(60)),
        child: Column(
          children: [
          /*  Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                '${Tr.of(context).ForgetPassword}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: sp(48),
                    fontWeight: FontWeight.bold),
              ),
            ),*/
            SizedBox(height: height(20)),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
              ),
              child: Text(
                '${Tr.of(context).loginPwdHint2}',
                style: TextStyle(
                    color: Color(0xffB7B7B7),
                    fontSize: sp(24),
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: height(20)),
            Container(
              height: height(88),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: width(40)),
              decoration: BoxDecoration(
                  border: new Border.all(color: Color(0xFFE7E7E7), width: width(2)),

                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(circular),
                    bottomRight: Radius.circular(circular),
                    topLeft: Radius.circular(circular),
                    topRight: Radius.circular(circular),
                  )),
              child: FocusWidget(
                focusNode: _psw1Focus,
                child: InputWidget2(
                  controller: _psw1Ctr,
                  focusNode: _psw1Focus,
                  hintText: '${Tr.of(context).SetNewPassword}',
                  suffixIconConstraintsMaxWidth: 30,
                  suffixIconConstraintsMinWidth: 30,
                  suffixIconConstraintsMaxHeight: 100,
                  suffixIconConstraintsMinHeight: 30,
                  obscureText: !isopen,
                  suffixIcon: GestureDetector(
                    onTap: () => {setState(() => isopen = !isopen)},
                    child: ImageIcon(
                        AssetImage(
                            'images/login/${isopen ? 'open' : 'close'}.png'),
                        color: isopen ? kPrimaryColor : Color(0xff787878)),
                  ),
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
                  border: new Border.all(color: Color(0xFFE7E7E7), width: width(2)),
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(circular),
                    bottomRight: Radius.circular(circular),
                    topLeft: Radius.circular(circular),
                    topRight: Radius.circular(circular),
                  )),
              child: FocusWidget(
                focusNode: _psw2Focus,
                child: InputWidget2(
                  controller: _psw2Ctr,
                  focusNode: _psw2Focus,
                  hintText: '${Tr.of(context).InputPassword2}',
                  suffixIconConstraintsMaxWidth: 30,
                  suffixIconConstraintsMinWidth: 30,
                  suffixIconConstraintsMaxHeight: 100,
                  suffixIconConstraintsMinHeight: 30,
                  obscureText: !isopen2,
                  suffixIcon: GestureDetector(
                    onTap: () => {setState(() => isopen2 = !isopen2)},
                    child: ImageIcon(
                        AssetImage(
                            'images/login/${isopen2 ? 'open' : 'close'}.png'),
                        color: isopen2 ? kPrimaryColor : Color(0xff787878)),
                  ),
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
                  border: new Border.all(color: Color(0xFFE7E7E7), width: width(2)),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(circular),
                    bottomRight: Radius.circular(circular),
                    topLeft: Radius.circular(circular),
                    topRight: Radius.circular(circular),
                  )),
              child: FocusWidget(
                focusNode: _codeFocus,
                child: InputWidget2(
                  obscureText: false,
                  controller: _codeCtr,
                  focusNode: _codeFocus,
                  hintText: '${Tr.of(context).hintInputVerificationCode}',
                  getVCode: () {
                    if (widget.account.contains('@')) {
                      return getVcode('email');
                    } else {
                      return getVcode('sms');
                    }
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
              onTap: () {
                if (!validInput()) {
                  return;
                }
                confirm();
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: height(36)),
                height: height(88),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(circular),
                    bottomRight: Radius.circular(circular),
                    topLeft: Radius.circular(circular),
                    topRight: Radius.circular(circular),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${Tr.of(context).determine}',
                  style: TextStyle(color: Colors.white, fontSize: sp(28)),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  bool validInput() {
    if (_psw1Ctr.text.isEmpty) {
      Toast.showText(Tr.of(context).PasswordEmptyHint);
      return false;
    } else if (_psw2Ctr.text.isEmpty) {
      Toast.showText(Tr.of(context).confirmPasswordHint);
      return false;
    } else if (_psw1Ctr.text != _psw2Ctr.text) {
      Toast.showText(Tr.of(context).passwordHint2);
      return false;
    } else if (_codeCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).hintInputVerificationCode);
      return false;
    }
    return true;
  }

  void confirm() async {
    if (widget.account.contains('@')) {
      Map data = {
        "email": widget.account,
        "email_code": _codeCtr.text,
        "login_password": _psw1Ctr.text,
      };
      await LoginServer.resetPswbyEmail(data);
      Toast.showSuccess(Tr.of(context).Passwordreset);
      _codeCtr.text = '';
      _psw1Ctr.text = '';
      _psw2Ctr.text = '';
    } else {
      // 手机必填
      Map data = {
        "mobile": widget.account,
        "sms_code": _codeCtr.text,
        "login_password": _psw1Ctr.text,
      };
      await LoginServer.resetPswbyMobile(data);
      Toast.showSuccess(Tr.of(context).Passwordreset);
      _codeCtr.text = '';

      _psw1Ctr.text = '';
      _psw2Ctr.text = '';
    }
    RouterUtil.push(context, Routes.login, clearStack: true, replace: true);
  }

  Future<bool> getVcode(type) async {
    try {
      if (type == 'sms') {
        if (widget.account.isEmpty) {
          Toast.close();
          return Toast.showText(Tr.of(context).phoneInputHint);
        } else {
          await LoginServer.sms('', widget.account);
          return Future.value(true);
        }
      } else {
        if (widget.account.isEmpty) {
          Toast.close();
          return Toast.showText(Tr.of(context).emailInputHint);
        } else {
          await LoginServer.email(widget.account);
          return Future.value(true);
        }
      }
    } catch (e) {
      GlobalConfig.errorTips(e);
      return Future.value(false);
    }
  }
}

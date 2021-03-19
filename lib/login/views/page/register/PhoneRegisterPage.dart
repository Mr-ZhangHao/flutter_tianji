import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/input/text_input2.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/login/routes/index.dart';
import 'package:flutter_tianji/login/server/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';

class PhoneRegisterWidget extends StatefulWidget {
  const PhoneRegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  _PhoneRegisterWidget createState() => _PhoneRegisterWidget();
}

class _PhoneRegisterWidget extends State<PhoneRegisterWidget>
    with AutomaticKeepAliveClientMixin {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();
  bool wantKeepAlive = true;
  String area = '86';
  String area_name = '中国';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height(40),
          ),
          Container(
            height: height(88),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: width(60)),
            padding: EdgeInsets.symmetric(horizontal: width(40)),
            decoration: BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(44),
                  bottomRight: Radius.circular(44),
                  topLeft: Radius.circular(44),
                  topRight: Radius.circular(44),
                )),
            child: FocusWidget(
              focusNode: _nameFocus,
              child: InputWidget2(
                prefixIconConstraintsMaxHeight: 28,
                prefixIconConstraintsMaxWidth: 100,
                prefixIconConstraintsMinHeight: 28,
                prefixIconConstraintsMinWidth: 28,
                suffixIconConstraintsMaxWidth: 100,
                suffixIconConstraintsMinWidth: 100,
                suffixIconConstraintsMaxHeight: 28,
                suffixIconConstraintsMinHeight: 28,
                keyboardType: TextInputType.phone,
                maxHeight: 100,
                controller: _nameCtr,
                focusNode: _nameFocus,
                hintText: '${Tr.of(context).hintInputPhone}',
                contentPadding: EdgeInsets.symmetric(horizontal: width(20)),
                prefixIcon: GestureDetector(
                  child: Text(
                    '+$area ',
                    style: TextStyle(color: Color(0xff7865FE)),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, LoginRouter.country)
                        .then((value) {
                      setState(() {
                        List myList = value;
                        area = myList[1];
                      });
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: height(40),
          ),
          Container(
            height: height(88),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: width(DefaultPadding)),
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
                obscureText: false,
                controller: _codeCtr,
                focusNode: _codeFocus,
                hintText: '${Tr.of(context).hintInputVerificationCode}',
                getVCode: () {
                  return getVcode('sms');
                },
                keyboardType: TextInputType.number,
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
                if (!validInput('sms')) {
                  return;
                }
                RouterUtil.pushResult(
                    context,
                    "${LoginRouter.setpwd}?name=${_nameCtr.text}&code=${_codeCtr.text}&area=${area}&type=sms",
                    (result) {});
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width(DefaultPadding)),
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
                    '${Tr.of(context).Nextstep}',
                    style: TextStyle(color: Colors.white, fontSize: sp(28)),
                  ),
                ),
              )),
          SizedBox(
            height: height(74),
          ),
          GestureDetector(
              onTap: () => RouterUtil.goBack(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${Tr.of(context).haveAccount}',
                    style:
                        TextStyle(color: Color(0xffA2A2A2), fontSize: sp(28)),
                  ),
                  Text(
                    '${Tr.of(context).GoToLogin}',
                    style: TextStyle(color: kPrimaryColor, fontSize: sp(28)),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  bool validInput(type) {
    if (type == 'sms') {
      if (_nameCtr.text == null || _nameCtr.text == "") {
        Toast.showText(Tr.of(context).phoneInputHint);
        return false;
      }
      if (_codeCtr.text == null || _codeCtr.text == "") {
        Toast.showText(Tr.of(context).PhoneCodeHint);
        return false;
      }
    } else {
      if (_nameCtr.text == null || _nameCtr.text == "") {
        Toast.showText(Tr.of(context).emailInputHint);
        return false;
      }
      if (_codeCtr.text == null || _codeCtr.text == "") {
        Toast.showText(Tr.of(context).emailCodeInputHint);
        return false;
      }
    }

    return true;
  }

  Future<bool> getVcode(type) async {
    try {
      if (type == 'sms') {
        if (_nameCtr.text.isEmpty) {
          Toast.close();
          return Toast.showText(Tr.of(context).phoneInputHint);
        } else {
          await LoginServer.sms('${area}', _nameCtr.text);
          return Future.value(true);
        }
      } else {
        if (_nameCtr.text.isEmpty) {
          Toast.close();
          return Toast.showText(Tr.of(context).emailInputHint);
        } else {
          await LoginServer.email(_nameCtr.text);
          return Future.value(true);
        }
      }
    } catch (e) {
      GlobalConfig.errorTips(e);
      return Future.value(false);
    }
  }
}

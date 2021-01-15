import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/input/text_input2.dart';
import 'package:flutter_tianji/login/routes/index.dart';
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
                maxHeight: 100,
                controller: _nameCtr,
                focusNode: _nameFocus,
                hintText: '${Tr.of(context).hintInputPhone}',
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
                obscureText: true,
                controller: _codeCtr,
                focusNode: _codeFocus,
                hintText: '${Tr.of(context).hintInputVerificationCode}',
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
              onTap: () => RouterUtil.push(context, LoginRouter.setpwd,
                  replace: true, clearStack: false),
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

/*  _login() async {
    if (_nameCtr.text.isEmpty) {
      Toast.showText('请输入手机号或邮箱账号');
    } else if (_pswCtr.text.isEmpty) {
      Toast.showText('请输入密码');
    } else {}
*/ /*
      showCenterDialog(context,
          SecurityVerificationWidget(loginType: VerificationType.phone));
*/ /*

    try {
      Toast.showLoading('loading');
      // var res = await UserServer.login(_nameCtr.text, _pswCtr.text);
      await SpUtils.sp.setString('token', 'res["data"]["access_token"]');
      Provider.of<UserProvider>(context, listen: false).setIsLogin(true);
      RouterUtil.push(context, Routes.home, replace: true, clearStack: true);
      Toast.close();
      Toast.showSuccess('登录成功');
    } catch (e) {
      GlobalConfig.errorTips(e);
    }
  }*/
}

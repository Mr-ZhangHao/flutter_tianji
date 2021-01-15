
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/input/text_input2.dart';
import 'package:flutter_tianji/login/routes/index.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';

class PhoneLoginWidget extends StatefulWidget {
  const PhoneLoginWidget({
    Key key,
  }) : super(key: key);

  @override
  _PhoneLoginWidgetState createState() => _PhoneLoginWidgetState();
}

class _PhoneLoginWidgetState extends State<PhoneLoginWidget> with AutomaticKeepAliveClientMixin {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final _pswCtr = TextEditingController();
  final FocusNode _pswFocus = FocusNode();
  bool wantKeepAlive = true;

  bool isCode = true ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: height(40),),
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
          SizedBox(height: height(40),),
         isCode ?
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
            child:       FocusWidget(
              focusNode: _pswFocus,
              child:  InputWidget2(
                obscureText: true,
                controller: _pswCtr,
                focusNode: _pswFocus,
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
          ): Container(
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
           child:       FocusWidget(
             focusNode: _pswFocus,
             child:  InputWidget2(
               obscureText: true,
               controller: _pswCtr,
               focusNode: _pswFocus,
               hintText: '${Tr.of(context).LoginPassword}',
               suffixIconConstraintsMaxWidth: 160,
               suffixIconConstraintsMinWidth: 160,
               suffixIconConstraintsMaxHeight: 60,
               suffixIconConstraintsMinHeight: 60,
               maxHeight: 100,
             ),
           ),
         ),
          SizedBox(height: height(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(46)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () =>
                  setState((){
                      isCode=!isCode;
                }),
                  child:
                  Text(isCode ? '${Tr.of(context).LoginPassword}':'${Tr.of(context).LoginVerificationCode}', style: TextStyle(color: kPrimaryblackColor)),
                ),
                GestureDetector(
                    onTap: () => RouterUtil.push(context, LoginRouter.forgot),
                    child: Text('${Tr.of(context).ForgetPassword}',
                        style: TextStyle(color: kPrimaryblackColor))),
              ],
            ),
          ),
          GestureDetector(
            //  onTap: _login,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width(46)),
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
                    '${Tr.of(context).Login}',
                    style: TextStyle(color: Colors.white, fontSize: sp(28)),
                  ),
                ),
              )),
          SizedBox(
            height: height(74),
          ),
          GestureDetector(
            onTap: () =>
                RouterUtil.push(context, LoginRouter.register,
                    replace: false, clearStack: false),
            child: Text(
              '${Tr.of(context).createAccount}',
              style: TextStyle(color: kPrimaryColor, fontSize: sp(28)),
            ),
          ),
        ],
      ),
    );
  }

  

  /*_login() async {
    if (_nameCtr.text.isEmpty) {
      Toast.showText('请输入手机号或邮箱账号');
    } else if (_pswCtr.text.isEmpty) {
      Toast.showText('请输入密码');
    } else {}
*//*
      showCenterDialog(context,
          SecurityVerificationWidget(loginType: VerificationType.phone));
*//*

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
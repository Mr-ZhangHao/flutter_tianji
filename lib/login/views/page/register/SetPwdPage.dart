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

class SetPwdPageWidget extends StatefulWidget {
  final String name;
  final String code;
  final String area;
  final String type;
  const SetPwdPageWidget({Key key, this.name, this.code, this.area, this.type})
      : super(
          key: key,
        );

  @override
  _SetPwdPageWidgetState createState() => _SetPwdPageWidgetState();
}

class _SetPwdPageWidgetState extends State<SetPwdPageWidget> {
  final _psw1Ctr = TextEditingController();
  final FocusNode _psw1Focus = FocusNode();
  final _psw2Ctr = TextEditingController();
  final FocusNode _psw2Focus = FocusNode();
  final _InvitationCodeCtr = TextEditingController();
  final FocusNode _InvitationCodeFocus = FocusNode();
  bool isopen = false;
  bool checked = false;

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
                '设置登录密码',
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
                    color: Color(0xffB7B7B7),
                    fontSize: sp(28),
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: height(54)),
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
                focusNode: _psw1Focus,
                child: InputWidget2(
                  obscureText: !isopen,
                  controller: _psw1Ctr,
                  focusNode: _psw1Focus,
                  hintText: '设置密码',
                  prefixIcon: ImageIcon(AssetImage('images/login/key.png'),
                      color: Color(0xffBFBFBF)),
                  suffixIcon: GestureDetector(
                    onTap: () => {setState(() => isopen = !isopen)},
                    child: ImageIcon(
                        AssetImage(
                            'images/login/${isopen ? 'open' : 'close'}.png'),
                        color: isopen ? kPrimaryColor : Color(0xffBFBFBF)),
                  ),
                  suffixIconConstraintsMaxWidth: 28,
                  suffixIconConstraintsMinWidth: 28,
                  suffixIconConstraintsMaxHeight: 100,
                  suffixIconConstraintsMinHeight: 28,
                  maxHeight: 100,
                ),
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
              child: FocusWidget(
                focusNode: _InvitationCodeFocus,
                child: InputWidget2(
                  obscureText: false,
                  controller: _InvitationCodeCtr,
                  focusNode: _InvitationCodeFocus,
                  hintText: '邀请码（选填）',
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              ),
            ),
            SizedBox(height: height(20)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: checked,
                    onChanged: (value) => setState(() => checked = value)),
                Text(
                  '我已阅读并同意使用',
                  style: TextStyle(color: Color(0xffA2A2A2), fontSize: sp(28)),
                ),
                Text(
                  '《天玑阁协议》',
                  style: TextStyle(color: kPrimaryColor, fontSize: sp(28)),
                ),
              ],
            ),
            SizedBox(height: height(74)),
            GestureDetector(
              onTap: () => register(),
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
                  '立即注册',
                  style: TextStyle(color: Colors.white, fontSize: sp(28)),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void register() async {
    if (_psw1Ctr.text.isEmpty) {
      Toast.showText(Tr.of(context).PasswordEmptyHint);
    } else if (!checked) {
      Toast.showText(Tr.of(context).termsHint);
    } else {
      Toast.showLoading('loading');

      print("type:${widget.type}");
      try {
        if (widget.type == 'sms') {
          await LoginServer.registerMobile('${widget.area}', widget.name,
              widget.code, _psw1Ctr.text, _InvitationCodeCtr.text);
        } else {
          await LoginServer.registerEmail(
              widget.name, widget.code, _psw1Ctr.text, _InvitationCodeCtr.text);
        }
        _psw1Ctr.text = '';
        _InvitationCodeCtr.text = '';
        Toast.showSuccess(Tr.of(context).RegisteredSuccessfu);
        RouterUtil.push(context, Routes.login,
            clearStack: true, replace: false);
      } catch (e) {
        GlobalConfig.errorTips(e);
      }
    }
  }
}

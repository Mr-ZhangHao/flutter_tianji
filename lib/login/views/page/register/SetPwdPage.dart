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
      appBar:    Utils.getCommonAppBar(context, '${Tr.of(context).SetPassword}'),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: width(60)),
        child: Column(
          children: [
            SizedBox(height: height(36)),
     /*       Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                '${Tr.of(context).SetPassword}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: sp(48),
                    fontWeight: FontWeight.bold),
              ),
            ),*/
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
              ),
              child: Text(
                '${Tr.of(context).loginPwdHint2}',
                style: TextStyle(
                    color: Color(0xff808080),
                    fontSize: sp(28),
                    fontWeight: FontWeight.normal),
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
                focusNode: _psw1Focus,
                child: InputWidget2(
                  obscureText: !isopen,
                  controller: _psw1Ctr,
                  focusNode: _psw1Focus,
                  hintText: '${Tr.of(context).LoginPassword}',
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
            SizedBox(height: height(40)),
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
                  hintText: '${Tr.of(context).InvitationCodeHint}',
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
                Container(
                  child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: checked,
                      onChanged: (value) => setState(() => checked = value)),
                ),
                Text(
                  '${Tr.of(context).TJAgreement2}',
                  style: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                ),
                Text(
                  '${Tr.of(context).TJAgreement}',
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
                  '${Tr.of(context).SignUpNow}',
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

/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 11:03:58
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 13:38:35
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/money_psw.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/common/verivication/vertify_form.dart';
import 'package:flutter_tianji/core/model/tfa_type_model.dart';
import 'package:flutter_tianji/mine/server/index.dart';
import 'package:flutter_tianji/login/server/index.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class MoneyPswPage extends StatefulWidget {
  MoneyPswPage({Key key}) : super(key: key);

  @override
  _MoneyPswPageState createState() => _MoneyPswPageState();
}

class _MoneyPswPageState extends State<MoneyPswPage> {
  final _psw1Ctr = TextEditingController();
  final FocusNode _psw1Focus = FocusNode();
  final _psw2Ctr = TextEditingController();
  final FocusNode _psw2Focus = FocusNode();

  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  final _ecodeCtr = TextEditingController();
  final FocusNode _ecodeFocus = FocusNode();

  final _gcodeCtr = TextEditingController();
  final FocusNode _gcodeFocus = FocusNode();

  String errorText = '';

  bool isError = false;

  bool isLoading = false;
  bool isopen = false;
  bool isopen2 = false;
  TfaTypeModel tfaType;
  @override
  void initState() {
    super.initState();
    LoginServer.getVertifyType(100,
            Provider.of<MineProvider>(context, listen: false).userInfo.username)
        .then((res) => setState(() => tfaType = res));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    Utils.getCommonAppBar(context, '${Tr.of(context).moneyPassword}'),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(35)),
          child: Column(
            children: <Widget>[
              FocusWidget(
                focusNode: _psw1Focus,
                child: InputWidget(
                  textAlign: TextAlign.left,
                  maxHeight: 100,
                  focusNode: _psw1Focus,
                  hintText: Tr.of(context).passwordLimitHint,
                  controller: _psw1Ctr,
                  prefixIconConstraintsMaxWidth: 150,
                  prefixIconConstraintsMinWidth: 150,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxWidth: 28,
                  suffixIconConstraintsMinWidth: 28,
                  suffixIconConstraintsMaxHeight: 100,
                  suffixIconConstraintsMinHeight: 28,
                  obscureText: !isopen,
                  suffixIcon: GestureDetector(
                    onTap: () => {setState(() => isopen = !isopen)},
                    child: ImageIcon(
                        AssetImage(
                            'images/login/${isopen ? 'open' : 'close'}.png'),
                        color: isopen ? kPrimaryColor : Color(0xff787878)),
                  ),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    alignment: Alignment.centerLeft,
                    child: Utils.normalText("${Tr.of(context).moneyPassword}：",
                    ),
                  ),
                 ),
              ),
              FocusWidget(
                focusNode: _psw2Focus,
                child: InputWidget(
                  maxHeight: 100,
                  hintText: Tr.of(context).RepeatPassword,
                  controller: _psw2Ctr,
                  focusNode: _psw2Focus,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 200,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxWidth: 28,
                  suffixIconConstraintsMinWidth: 28,
                  suffixIconConstraintsMaxHeight: 100,
                  suffixIconConstraintsMinHeight: 28,
                  obscureText: !isopen2,
                  suffixIcon: GestureDetector(
                    onTap: () => {setState(() => isopen2 = !isopen2)},
                    child: ImageIcon(
                        AssetImage(
                            'images/login/${isopen2 ? 'open' : 'close'}.png'),
                        color: isopen2 ? kPrimaryColor : Color(0xff787878)),
                  ),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),

                  prefixIcon: Container(
                    alignment: Alignment.centerLeft,
                    child: Utils.normalText("${Tr.of(context).ConfirmMoneyPassword}：",
                    ),
                  ),
                ),
              ),
              BuildVertifyForm(
                  tfaType: tfaType?.tfaType ?? 0,
                  context: context,
                  codeFocus: _codeFocus,
                  codeCtr: _codeCtr,
                  ecodeFocus: _ecodeFocus,
                  ecodeCtr: _ecodeCtr,
                  gcodeFocus: _gcodeFocus,
                  gcodeCtr: _gcodeCtr),
              Visibility(
                  visible: isError,
                  child: Text(errorText,
                      style: TextStyle(color: Color(0xffFF3838)))),
              SizedBox(height: height(70)),
              MyButton(text: Tr.of(context).submit, onPressed: _confirm)
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
     // resizeToAvoidBottomPadding: false,
    );
  }

  void _confirm() async {
    int tfaType =
        Provider.of<MineProvider>(context, listen: false).userInfo.tfaType;
    if (_psw1Ctr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).moneypwdEmptyHint;
      });
    } else if (_psw2Ctr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).moneypwdEmptyHint2;
      });
    } else if (_psw1Ctr.text != _psw2Ctr.text) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).passwordHint2;
      });
    } else if ((tfaType == 1 || tfaType == 3 || tfaType == 5 || tfaType == 6) &&
        _codeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PhoneCodeHint;
      });
    } else if ((tfaType == 2 || tfaType == 4) && _ecodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).EmailCodeHint;
      });
    } else if ((tfaType == 7) && _gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).GoogleCodeHint;
      });
    } else {
      setState(() {
        isLoading = false;
        isError = false;
        errorText = '';
      });
      Toast.showLoading('loading...');
      try {
        await MineServer.setPayPsw(
            _psw1Ctr.text, _ecodeCtr.text, _codeCtr.text, _gcodeCtr.text);
        Toast.showSuccess(Tr.of(context).SetSuccessfully);
        _psw1Ctr.text = '';
        _psw2Ctr.text = '';
        _ecodeCtr.text = '';
        _codeCtr.text = '';
        _gcodeCtr.text = '';
        Provider.of<MineProvider>(context, listen: false).getUserInfo();
        RouterUtil.goBack(context);
      } catch (e) {
        print(e);
      }
    }
  }
}

/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 11:03:58
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 16:17:01
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/bind_email.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
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

class BindEmailPage extends StatefulWidget {
  BindEmailPage({Key key}) : super(key: key);

  @override
  _BindEmailPageState createState() => _BindEmailPageState();
}

class _BindEmailPageState extends State<BindEmailPage> {
  final _emailCtr = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  final _ecodeCtr = TextEditingController();
  final FocusNode _ecodeFocus = FocusNode();

  final _gcodeCtr = TextEditingController();
  final FocusNode _gcodeFocus = FocusNode();

  String errorText = '';

  bool isError = false;

  bool isLoading = false;
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
      appBar:    Utils.getCommonAppBar(context, '${Tr.of(context).bindMailbox}'),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              // SizedBox(height: height(20)),
              FocusWidget(
                focusNode: _emailFocus,
                child: InputWidget(
                  focusNode: _emailFocus,
                  controller: _emailCtr,
                  maxHeight: 100,
                  obscureText: false,
                  hintText: Tr.of(context).enterEmailAddress,
                  prefixIconConstraintsMaxWidth: 150,
                  prefixIconConstraintsMinWidth: 150,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('${Tr.of(context).mailbox}：',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _ecodeFocus,
                child: InputWidget(
                  focusNode: _ecodeFocus,
                  controller: _ecodeCtr,
                  maxHeight: 100,
                  hintText: Tr.of(context).emailCodeInputHint,
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxWidth: 160,
                  getVCode: () async {
                    return await getVcode('email');
                  },
                  contentPadding: EdgeInsets.only(top: height(10)),
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
              MyButton(text: Tr.of(context).determine, onPressed: _confirm)
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
   //   resizeToAvoidBottomPadding: false,
    );
  }

  void _confirm() async {
    int tfaType =
        Provider.of<MineProvider>(context, listen: false).userInfo.tfaType;
    if (_emailCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).emailInputHint;
      });
    } else if ((tfaType == 3 || tfaType == 4 || tfaType == 5 || tfaType == 7) &&
        _gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).GoogleCodeHint;
      });
    } else if ((tfaType == 2 || tfaType == 4 || tfaType == 5 || tfaType == 6) &&
        _ecodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).EmailCodeHint;
      });
    } else if ((tfaType == 1 || tfaType == 3 || tfaType == 5 || tfaType == 6) &&
        _codeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PhoneCodeHint;
      });
    } else {
      setState(() {
        isLoading = false;
        isError = false;
        errorText = '';
      });
      Toast.showLoading('loading...');
      try {
        await MineServer.bindEmail(
            _emailCtr.text, _ecodeCtr.text, _codeCtr.text, _gcodeCtr.text);
        Toast.showText(Tr.of(context).BindingSubmitte);
        _emailCtr.text = '';
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

  Future<bool> getVcode(type) async {
    if (_emailCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).emailInputHint);
      return Future.value(false);
    } /* else if(!Utils.isEmail(_emailCtr.text)){
      Toast.showText(Tr.of(context).emailInputHint);
    }*/
    else {
      try {
        if (type == 'sms') {
          await LoginServer.sms('', _emailCtr.text);
          return Future.value(true);
        } else {
          await LoginServer.email(_emailCtr.text);
          return Future.value(true);
        }
      } catch (e) {
        print(e);
        return Future.value(false);
      }
    }
  }
}

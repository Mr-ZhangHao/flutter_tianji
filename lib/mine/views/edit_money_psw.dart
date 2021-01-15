import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/common/verivication/vertify_form.dart';
import 'package:flutter_tianji/core/model/tfa_type_model.dart';
import 'package:flutter_tianji/core/services/mine.dart';
import 'package:flutter_tianji/login/server/index.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:provider/provider.dart';

class EditMoneyPswPage extends StatefulWidget {
  EditMoneyPswPage({Key key}) : super(key: key);

  @override
  _EditMoneyPswPageState createState() => _EditMoneyPswPageState();
}

class _EditMoneyPswPageState extends State<EditMoneyPswPage> {
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
  TfaTypeModel tfaType;
  @override
  void initState() {
    super.initState();
    LoginServer.getVertifyType(100,
            Provider.of<MineProvider>(context, listen: false).userInfo.tfaType)
        .then((res) => setState(() => tfaType = res));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).ChangeFundPassword),
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => RouterUtil.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png',
                  width: width(22), height: height(36)),
            )),
      ),
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
                  maxHeight: 100,
                  obscureText: true,
                  focusNode: _psw1Focus,
                  hintText: Tr.of(context).passwordLimitHint,
                  controller: _psw1Ctr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 200,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                      child: Text('${Tr.of(context).NewMoneyPassword}：',
                          style: TextStyle(color: Colors.black))),
                ),
              ),
              FocusWidget(
                focusNode: _psw2Focus,
                child: InputWidget(
                  maxHeight: 100,
                  hintText: Tr.of(context).ConfirmMoneyPassword,
                  obscureText: true,
                  controller: _psw2Ctr,
                  focusNode: _psw2Focus,
                  prefixIconConstraintsMaxWidth: 230,
                  prefixIconConstraintsMinWidth: 230,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                      child: Text('${Tr.of(context).ConfirmMoneyPassword}：',
                          style: TextStyle(color: Colors.black))),
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
      resizeToAvoidBottomPadding: false,
    );
  }

  void _confirm() async {
    int tfaType = this.tfaType?.tfaType;
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
        errorText = '';
        isError = false;
      });
      Toast.showLoading('loading...');
      try {
        await MineServer.setPayPsw(_psw1Ctr.text, _ecodeCtr.text ?? '',
            _codeCtr.text ?? '', _gcodeCtr.text ?? '');
        _psw1Ctr.text = '';
        _psw2Ctr.text = '';
        _ecodeCtr.text = '';
        _codeCtr.text = '';
        _gcodeCtr.text = '';
        Toast.showSuccess(Tr.of(context).SuccessfullyModified);

        Provider.of<MineProvider>(context, listen: false).getUserInfo();
        RouterUtil.goBack(context);
      } catch (e) {
        print(e);
      }
    }
  }
}

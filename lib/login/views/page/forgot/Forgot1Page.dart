import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/input/text_input2.dart';
import 'package:flutter_tianji/login/routes/index.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';

class Forgot1PageWidget extends StatefulWidget {
  const Forgot1PageWidget({
    Key key,
  }) : super(key: key);

  @override
  _Forgot1PageWidgetState createState() => _Forgot1PageWidgetState();
}

class _Forgot1PageWidgetState extends State<Forgot1PageWidget> {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

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
            SizedBox(height: height(74)),
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
                focusNode: _nameFocus,
                child: InputWidget2(
                  controller: _nameCtr,
                  focusNode: _nameFocus,
                  hintText: '邮箱或手机号',
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              ),
            ),
            SizedBox(height: height(60)),
            GestureDetector(
              onTap: () {
                RouterUtil.pushResult(
                    context,
                    "${LoginRouter.forgot2}?account=${_nameCtr.text}",
                    (result) {});
              },
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
                  '下一步',
                  style: TextStyle(color: Colors.white, fontSize: sp(28)),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

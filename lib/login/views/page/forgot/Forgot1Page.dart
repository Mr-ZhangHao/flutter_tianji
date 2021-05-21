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
import 'package:flutter_tianji/utils/util.dart';

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
      appBar:    Utils.getCommonAppBar(context, '${Tr.of(context).FindPassword}'),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: width(60)),
        child: Column(
          children: [

            SizedBox(height: height(60)),
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
                focusNode: _nameFocus,
                child: InputWidget2(
                  controller: _nameCtr,
                  focusNode: _nameFocus,
                  hintText: '${Tr.of(context).hintInputEmailOrPhone}',
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              ),
            ),
            SizedBox(height: height(80)),
            GestureDetector(
              onTap: () {
                RouterUtil.pushResult(
                    context,
                    "${LoginRouter.forgot2}?account=${_nameCtr.text}",
                    (result) {});
              },
              child: Container(
                width: double.infinity,
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
                  '${Tr.of(context).Nextstep}',
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

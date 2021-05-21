
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/utils/screen.dart';

class UnPhishingpage extends StatefulWidget {
  UnPhishingpage({Key key}) : super(key: key);

  @override
  _UnPhishingpageState createState() => _UnPhishingpageState();
}

class _UnPhishingpageState extends State<UnPhishingpage> {
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置防钓鱼码'),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(35)),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height(8), horizontal: width(10)),
                margin: EdgeInsets.symmetric(vertical: height(28)),
                decoration: BoxDecoration(
                    color: Color(0xffF6F9FB),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.info, color: Color(0xffCAD3E1), size: sp(30)),
                    SizedBox(width: width(10)),
                    Expanded(
                      child: Text(
                        '防钓鱼码可以防范假冒ETF网站和邮件。设置后ETF给您发 送邮件中包含此码，没有包含的作为诈骗邮件。',
                        maxLines: 2,
                        style: TextStyle(fontSize: sp(24)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height(30)),
              FocusWidget(
                focusNode: _codeFocus,
                child: InputWidget(
                  maxHeight: 100,
                  focusNode: _codeFocus,
                  hintText: '请输入8-32位英文或数字',
                  controller: _codeCtr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(
                      '防钓鱼码：',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height(100)),
              MyButton(
                text: '提交',
                // onPressed: () {},
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
     // resizeToAvoidBottomPadding: false,
    );
  }
}

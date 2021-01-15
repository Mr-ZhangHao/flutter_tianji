import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/mine/views/security.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

//扩充地址
class ExpandAddressPage extends StatefulWidget {
  @override
  _ExpandAddressPageState createState() => _ExpandAddressPageState();
}

class _ExpandAddressPageState extends State<ExpandAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Utils.getCommonAppBar(context, "扩充地址", elevation: 1, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "扩充记录",
              style: TextStyle(color: kPrimaryColor),
            ),
            SizedBox(
              width: width(30),
            ),
          ],
        )
      ]),
      body: Column(children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          child: Column(
            children: <Widget>[
              ListItemWidget(
                leading: '币种',
                linkText: '选择币种',
                linkColor: Color(0xff323232),
                //  onTab: () => RouterUtil.push(context, MineRouter.bindEmail),
              ),
              ListItemWidget(
                leading: '数量',
                linkText: '选择数量',
                linkColor: Color(0xff323232),
                //  onTab: () => RouterUtil.push(context, MineRouter.bindEmail),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
          flex: 1,
        ),
        MyButton(
          circular: 0,
          text: '确认扩充',
          // onPressed: () {},
        ),
      ]),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
    );
  }
}

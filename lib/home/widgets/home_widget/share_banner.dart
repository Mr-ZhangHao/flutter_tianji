/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-17 15:54:04
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 15:54:13
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/share_banner.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/screen.dart';

class ShareBanner extends StatelessWidget {
  const ShareBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width(40), vertical: height(30)),
      height: height(150),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/home/share.png'), fit: BoxFit.fill)),
    );
  }
}

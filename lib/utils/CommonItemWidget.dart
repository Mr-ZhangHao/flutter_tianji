
import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/screen.dart';

class CommonItemWidget extends StatelessWidget {
  const CommonItemWidget({
    Key key,
    this.image,
    this.text,
    this.onTab,
  }) : super(key: key);
  final String image;
  final String text;
  final Function onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height(100),
        margin: EdgeInsets.symmetric(horizontal: width(30)),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffEBEBEB)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Visibility(child:      Image.asset(image=="" ? "images/home/avatar.png":image,
                    fit: BoxFit.fill, width: width(44), height: height(44)),visible: image!="",),
                Visibility(child: SizedBox(width: width(28)),visible: image!="",),
                Text(
                  text,
                  style: TextStyle(fontSize: sp(28), color: Color(0xff909090)),
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_right_rounded,
                size: sp(40), color: Color(0xffD4D4D4)),
          ],
        ),
      ),
    );
  }
}
/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-20 10:37:39
* @LastEditors: Roy
* @LastEditTime: 2020-08-20 11:03:33
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/toast/drop-down.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import '../../utils/screen.dart';

class DropDown extends StatefulWidget {
  DropDown({Key key, this.selectType, this.list, this.onSelect})
      : super(key: key);
  final int selectType; //当前选择的下标
  final List list; //列表数据
  final Function onSelect; //回调函数
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0.0,
      top: .0,
      left: 0,
      bottom: 0,
      child: Container(
        color: Color(0xcc999999),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height(600),
              color: Colors.white,
              child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (BuildContext context, int index) {
                  Map map = widget.list[index];
                  return Container(
                    alignment: Alignment.centerLeft,
                    height: height(80),
                    padding: EdgeInsets.symmetric(horizontal: width(40)),
                    child: InkWell(
                      onTap: () {
                        widget.onSelect({
                          "type": index,
                          "coin_name": map['coin_name'],
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            map['coin_name'],
                            style: TextStyle(
                                color: index == widget.selectType
                                    ? kPrimaryColor
                                    : kTextColor3),
                          ),
                          index == widget.selectType?Container(
                            width: width(40),
                            height: height(40),
                            child:Image.asset('images/contract/duigou.png'),
                          ):SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

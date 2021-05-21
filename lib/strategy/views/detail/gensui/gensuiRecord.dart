import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/strategy/views/detail/gensui/gensuiRecordListView.dart';
import 'package:flutter_tianji/utils/screen.dart';

class gensuiRecordPage extends StatefulWidget {
  final String apiId;
  gensuiRecordPage({Key key, this.apiId}) : super(key: key);
  @override
  _gensuiRecordPageState createState() => _gensuiRecordPageState();
}

class _gensuiRecordPageState extends State<gensuiRecordPage> {
  int type = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(30)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width(150),
                height: height(60),
                margin: EdgeInsets.only(right: width(20)),
                decoration: BoxDecoration(
                    border: new Border.all(
                        color:
                            type == 1 ? kPrimaryColor : Color(0xff909090),
                        width: width(2)),
                    borderRadius: new BorderRadius.circular(width(8))),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('正在跟随',
                          style: TextStyle(
                            color: type == 1
                                ? kPrimaryColor
                                : Color(0xff909090),
                            fontSize: 12,
                          )),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      type = 1;
                    });
                  },
                ),
              ),
              Container(
                width: width(150),
                height: height(60),
                margin: EdgeInsets.only(right: width(20)),
                decoration: BoxDecoration(
                    border: new Border.all(
                        color:
                            type == 1 ? Color(0xff909090) : kPrimaryColor,
                        width: width(2)),
                    borderRadius: new BorderRadius.circular(width(8))),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('历史跟随',
                          style: TextStyle(
                            color: type == 1
                                ? Color(0xff909090)
                                : kPrimaryColor,
                            fontSize: 12,
                          )),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      type = 2;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: height(20),
          ),
          Visibility(
            child: Expanded(
                child: gensuiRecordListView(
              index: 1,
              id: widget.apiId,
            )),
            visible: type == 1,
          ),
          Visibility(
            child: Expanded(
                child: gensuiRecordListView(
              index: 2,
              id: widget.apiId,
            )),
            visible: type == 2,
          )
        ],
      ),
    );
  }
}

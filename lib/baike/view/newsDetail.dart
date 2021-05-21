import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class newsDetail extends StatefulWidget {
  final String title;
  final String contents;
  final String name;
  final String time;
  final String image;
  newsDetail({
    Key key,
    this.title,
    this.contents,
    this.name,
    this.time,
    this.image,
  }) : super(key: key);

  @override
  _newsDetailState createState() => _newsDetailState();
}

class _newsDetailState extends State<newsDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          title: Text('详情'),
          centerTitle: true,
          elevation: 0.5,
          leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => RouterUtil.goBack(context),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/mine/back@2x.png',
                    width: width(22), height: height(36)),
              )),
        ),
        body:  SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(width(20)),
                    padding: EdgeInsets.all(width(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Utils.normalText('${widget.title}',fontWeight: FontWeight.bold,fontSize: 32),
                        SizedBox(height: height(30),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Utils.normalText("${widget.name}",color: Color(0xff666666)),
                          Utils.normalText("${widget.time}",color: Color(0xff666666)),
                          ],
                        ),
                        SizedBox(height: height(20),),
                        Container(
                          child: Html(data: """
                           ${widget.contents}
                       """),
                        ),
                      ],
                    ))
        ));
  }
}

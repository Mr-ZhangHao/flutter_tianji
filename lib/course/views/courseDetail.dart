import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class courseDetail extends StatefulWidget {
  @override
  _courseDetailState createState() => _courseDetailState();
}

class _courseDetailState extends State<courseDetail> {

  int  indexs = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: Utils.getCommonAppBar(context, '课程详情'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              child: Image.asset("images/course/courseDetail_debug.png"),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: width(30), right: width(30), top: height(26)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.normalText('什么是区块链？'),
                  SizedBox(
                    height: height(40),
                  ),
                  Utils.normalText('分布式系统集群设计中面临着一个不可回避的问题，一致性问题。',
                      fontSize: 24),
                  SizedBox(
                    height: height(20),
                  ),
                  Utils.normalText('100W次观看  |  已更新100课时',
                      color: Color(0xffB7B7B7), fontSize: 20),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE7E7E7),
                          borderRadius: BorderRadius.circular(width(25)),
                        ),
                        child: Utils.normalText('币币交易',
                            fontSize: 20, color: Color(0xff2F6EFF)),
                        width: width(120),
                        alignment: Alignment.center,
                        height: height(42),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(30),
                  ),
                  Divider(
                    color: Color(0xffEAEAEA),
                    height: height(1),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: width(30), right: width(30), top: height(30),bottom: height(30)),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        highlightColor: Colors.transparent,
                        radius: 0.0,
                        child: Container(
                          margin: EdgeInsets.only(top: height(20)),
                          padding: EdgeInsets.all(width(20)),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F6FA),
                            borderRadius: BorderRadius.circular(width(8)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Utils.normalText('第${index}课：区块链的来源',color: indexs==index ? kPrimaryColor:Color(0xff323232)),
                              SizedBox(
                                height: height(10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.video_collection,size: 12,color: indexs==index ? kPrimaryColor:Color(0xffB7B7B7)),
                                      Utils.normalText('10分钟',color: indexs==index ? kPrimaryColor:Color(0xffB7B7B7)),
                                    ],
                                  ),
                                  Utils.normalText(indexs==index ?'正在播放':'已看完',color: indexs==index ? kPrimaryColor:Color(0xffB7B7B7)),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            this.indexs=index;
                          });
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

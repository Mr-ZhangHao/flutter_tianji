/*
* @message: 首页通知栏
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 15:48:21
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 16:24:12
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/noties.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tianji/home/provider/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:provider/provider.dart';

class NoticesBarWidget extends StatelessWidget {
  const NoticesBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: width(40), right: width(40)),
      decoration: BoxDecoration(
        // 边色与边宽度
        color: Colors.white, // 底色
        boxShadow: [
          BoxShadow(
            blurRadius: width(4), //阴影范围
            spreadRadius: width(2), //阴影浓度
            color: Color(0xffF2EAF3), //阴影颜色
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/home/laba.png',
              fit: BoxFit.contain, width: width(36), height: width(34)),
          Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider model, Widget child) {
              return Expanded(
                  child: Container(
                height: width(60),
                child: Swiper(
                  scrollDirection: Axis.vertical,
                  itemCount: model.notices.length ?? 0,
                  autoplay: true,
                  autoplayDelay: 3000,
                  autoplayDisableOnInteraction: true,
                  duration: 300,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        RouterUtil.goWebViewPage(
                            context,
                            model.notices[index].title,
                            model.notices[index].htmlUrl);
                      },
                      child: Container(
                        height: width(80),
                        margin: EdgeInsets.only(left: width(20)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          model.notices[index]?.title ?? '公告',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
              ));
            },
          ),

          // GestureDetector(
          //   onTap: () {},
          //   child: Text('更多',
          //       style: TextStyle(color: kPrimaryColor, fontSize: sp(24))),
          // )
        ],
      ),
    );
  }
}

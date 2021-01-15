/*
* @message: 首页轮播图
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 15:49:32
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 16:43:56
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/banner.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';

class AppBarBanner extends StatelessWidget {
  final Widget child;
  const AppBarBanner({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(340),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: height(210),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF00D8FF),
                  Color(0xFF003BCF),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

/// 卡片背景
class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 40);
    path.quadraticBezierTo(width / 2, height, width, height - 40);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SwiperBanner extends StatelessWidget {
  const SwiperBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(460),
      child: Swiper(
        autoplay: true,
        itemCount: 3,
        autoplayDisableOnInteraction: true,
        autoplayDelay: 5000,
        duration: 1000,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset('images/home/banner.png', fit: BoxFit.fill);
        },
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                size: width(10),
                activeSize: width(10),
                activeColor: kPrimaryColor,
                color: kTextColor9,
                space: width(10))),
      ),
    );
  }
}

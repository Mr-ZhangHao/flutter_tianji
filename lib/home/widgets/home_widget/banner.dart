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
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/home/provider/index.dart';
import 'package:flutter_tianji/home/widgets/home_widget/CustomSwiperPagination.dart';
import 'package:flutter_tianji/providers/provider_widget.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
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
      height: height(360),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
       /*     child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              //    Color(0xFF00D8FF),
                //  Color(0xFF003BCF),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
            ),*/
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
    return ProviderWidget<HomeProvider>(
      model: HomeProvider(),
      onModelReady: (model) => model.getBanner(),
      builder: (BuildContext context, HomeProvider model, Widget child) {
        if (model.isIdle) {
          return Container(
            height: height(458),
            child: Swiper(
           //  viewportFraction:1,
              fade: 1,
              autoplay: true,
              itemCount: model.banner.length??0,
              autoplayDisableOnInteraction: true,
              autoplayDelay: 5000,
              duration: 1000,
              scale: 0.95,
             // pagination: new SwiperPagination(),
               itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      RouterUtil.goWebViewPage(
                          context, '', model.banner[index].link);
                    },
                    child: ExtendedImage.network(
                      model.banner[index].picture,
                      fit: BoxFit.fill,
                      cache: true,
                      shape: BoxShape.rectangle,
                      height: height(458),

                      loadStateChanged: (ExtendedImageState state) {
                        if (state.extendedImageLoadState ==
                            LoadState.completed) {
                          return ExtendedRawImage(
                            height: height(458),
                            image: state.extendedImageInfo?.image,
                            fit: BoxFit.fill,
                          );
                        } else {
                          return CupertinoActivityIndicator(animating: true);
                        }
                      },
                    ),
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12),
                    //       image: DecorationImage(image: NetworkImage(model.banner[index].picture), fit: BoxFit.fitWidth)),
                    // ),
                  );
                },
             //   pagination: CustomSwiperPagination(),

                pagination: SwiperPagination(
                    alignment: Alignment(-0, 0.65),
                    // alignment: Alignment(-0, 1.65),
                    builder: DotSwiperPaginationBuilder(
                      size: width(15),
                      activeSize: width(15),
                      activeColor: Color(0xff20FFFFFF),
                      color: Color(0xffFFFFFF),
                      space: width(10),
                    )),
                ),
          );
        } else {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: width(40)),
            height: height(320),
            width: double.infinity,
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}

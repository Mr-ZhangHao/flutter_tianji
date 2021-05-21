
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
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
      height: height(320),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
    /*        child: Container(
              height: height(210),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF00D8FF),
                  Color(0xFF003BCF),
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
    return ProviderWidget<baikeProvider>(
      model: baikeProvider(),
      onModelReady: (model) => model.getBanner(),
      builder: (BuildContext context, baikeProvider model, Widget child) {
        if (model.isIdle) {
          return Container(
            height: width(320),
            child: Swiper(
                autoplay: true,
                // viewportFraction: 0.85,
                fade: 1,
                scale: 0.95,
                itemCount: model.banner?.length ?? 0,
                autoplayDisableOnInteraction: true,
                autoplayDelay: 5000,
                duration: 1000,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      RouterUtil.goWebViewPage(
                          context, '', model.banner[index].link);
                    },
                    child: ExtendedImage.network(
                      model.banner[index].largePicture,
                      fit: BoxFit.fitWidth,
                      cache: true,
                      shape: BoxShape.rectangle,
                      height: width(320),
                      borderRadius:
                          BorderRadius.all(Radius.circular(width(12))),
                      loadStateChanged: (ExtendedImageState state) {
                        if (state.extendedImageLoadState ==
                            LoadState.completed) {
                          return ExtendedRawImage(
                            image: state.extendedImageInfo?.image,
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
                pagination: CustomSwiperPagination()
                /*           pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: CustomSwiperPagination(
                      activeColor: kWhite,
                      size: Size(width(20), 3.0),
                      activeSize: Size(10.0, 3.0))), */
                ),
          );
        } else {
          return Container(
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

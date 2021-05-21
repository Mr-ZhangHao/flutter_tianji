/*
* @message: 启动页
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-03-25 15:56:13
* @LastEditors: Jack
* @LastEditTime: 2020-08-26 23:39:38
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/splash/splash_page.dart
*/
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/routes/routes.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/sp_utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _countdownController;

  bool showGuide = false;
  bool isFirst = true;

  @override
  void initState() {
    final String token = SpUtils.sp.getString('token');
    setState(() => isFirst = token == '' || token == null);
    _countdownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _countdownController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          showGuide
              ? GuidePage()
              : Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                  AssetImage("images/splash/launch_image.png"),
                  fit: BoxFit.fill),
            ),
                child: Image.asset('images/splash/launch_image2.png', fit: BoxFit.fill),
          ),
          Visibility(
            visible: !showGuide,
            child: Align(
              alignment: Alignment.bottomRight,
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    _countdownController.stop();
                    if (isFirst) {
                      setState(() => showGuide = !showGuide);
                    } else {
                      nextPage(context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black.withAlpha(100),
                    ),
                    child: AnimatedCountdown(
                      context: context,
                      animation: StepTween(begin: 4, end: 0)
                          .animate(_countdownController),
                      callBack: () {
                        if (isFirst) {
                          setState(() => showGuide = !showGuide);
                        } else {
                          nextPage(context);
                        }
                      },
                    ),
                    // child: Text(_countdownController.duration.toString()),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;
  final Function callBack;

  AnimatedCountdown({key, this.animation, context, this.callBack})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // nextPage(context);
        this.callBack();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text(
      (value == 0 ? '' : '$value | ' + '跳过'),
      style: TextStyle(color: Colors.white),
    );
  }
}

void nextPage(context) {
  RouterUtil.push(context, Routes.home, replace: true);
}

class GuidePage extends StatefulWidget {
  static const List<String> images = <String>[
    'images/splash/guide01.png',
    'images/splash/guide02.png',
    'images/splash/guide03.png',
  ];

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Theme.of(context).primaryColor,
      child: Stack(
        alignment: Alignment(0, 0.87),
        children: <Widget>[
          Swiper(
              itemBuilder: (ctx, index) =>
                  Image.asset(GuidePage.images[index], fit: BoxFit.fill),
              itemCount: GuidePage.images.length,
              loop: false,
              onIndexChanged: (index) {
                setState(() => curIndex = index);
              }),
          Offstage(
            offstage: curIndex != GuidePage.images.length - 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: InkWell(
                  onTap: () => nextPage(context),
                  child: Container(
                    width: width(280),
                    height: height(86),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: width(50), vertical: height(150)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kWhite,
                    ),
                    child: Text('立即体验',
                        style:
                            TextStyle(color: kPrimaryColor, fontSize: sp(34))),
                    // child: Text(_countdownController.duration.toString()),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

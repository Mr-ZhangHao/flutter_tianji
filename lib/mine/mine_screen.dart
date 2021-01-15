/*
* @message: 个人中心
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-22 11:30:24
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/mine_screen.dart
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/mine/routes/index.dart';
import 'package:flutter_tianji/mine/views/security.dart';
import 'package:flutter_tianji/providers/gloable_provider.dart';
import 'package:flutter_tianji/providers/local_provider.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/routes/routes.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/sp_utils.dart';
import 'package:provider/provider.dart';

class MineScreen extends StatefulWidget {
  MineScreen({Key key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8FA),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title:
                Text('我的', style: TextStyle(color: kWhite, fontSize: sp(36))),
            leading: GestureDetector(
              onTap: () => RouterUtil.goBack(context),
              child: Icon(Icons.arrow_back_ios, size: sp(40), color: kWhite),
            ),
            centerTitle: true,
            elevation: 1,
            floating: true,
            backgroundColor: Color(0xffF9F8FA),
            ////滑动时是否悬浮
            pinned: true,
            //固定标题栏
            brightness: Brightness.dark,
            expandedHeight: height(417) + MediaQuery.of(context).padding.top,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              background: UserHeaderWidget(),
            ),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  ///切换语言
                  print("languageCode:" + Tr.locales.countryCode);
                  if (Tr.locales.countryCode == 'CN') {
                    Provider.of<LocalProvider>(context, listen: false)
                        .switchLocale(2);
                  } else if (Tr.locales.countryCode == 'US') {
                    Provider.of<LocalProvider>(context, listen: false)
                        .switchLocale(1);
                  }
                  /*else{
                      Provider.of<LocalProvider>(context,listen: false).switchLocale(1);
                    }*/
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: width(30)),
                  child: Image.asset('images/mine/ch.png',
                      width: width(80), height: width(48), fit: BoxFit.fill),
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: kWhite,
                child: Column(
                  children: <Widget>[
                    MineListItemWidget(
                      text: '我的资产',
                      image: '',
                      onTab: () {
                        Provider.of<GloableProvider>(context, listen: false)
                            .setCurrIndex(3);
                        RouterUtil.push(context, Routes.home);
                      },
                    ),
                    MineListItemWidget(
                      text: '充币地址',
                      image: '',
                      onTab: () {
                        Provider.of<GloableProvider>(context, listen: false)
                            .setCurrIndex(3);
                        RouterUtil.push(context, Routes.home);
                      },
                    ),
                    MineListItemWidget(
                      text: '${Tr.of(context).aboutUs}',
                      image: '',
                      onTab: () {
                        Provider.of<GloableProvider>(context, listen: false)
                            .setCurrIndex(3);
                        RouterUtil.push(context, Routes.home);
                      },
                    ),
                    Container(
                      height: height(20),
                      width: double.infinity,
                      color: Color(0xffF9F8FA),
                      child: SizedBox(height: height(20)),
                    ),
                    /*        MineListItemWidget(
                      text: '推广二维码',
                      image: '',
                      onTab: () => RouterUtil.push(context, MineRouter.share),
                    ),*/
                    /*     MineListItemWidget(
                      text: '关注我们',
                      image: '',
                      onTab: () => RouterUtil.push(context, MineRouter.focusUs),
                    ),*/
                    MineListItemWidget(
                      text: '资费标准',
                      image: '',
                      onTab: () => RouterUtil.push(context, MineRouter.rate),
                    ),
                    MineListItemWidget(
                      text: '帮助中心',
                      image: '',
                      onTab: () => RouterUtil.push(context, Routes.home),
                    ),
                    MineListItemWidget(
                      text: '版本',
                      image: '',
                      rightText: "v 1.0.0",
                      onTab: () => RouterUtil.push(context, Routes.home),
                    ),
                    MineListItemWidget(
                      text: '退出登录',
                      image: '',
                      onTab: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('是否确定退出？'),
                                content: Text(''),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('取消'),
                                    onPressed: () {
                                      RouterUtil.goBack(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('确定',
                                        style: TextStyle(
                                            color: Color(0xff909090))),
                                    onPressed: () async {
                                      // userProvidr.setIsLogin(false);
                                      await SpUtils.sp.clear();
                                      RouterUtil.push(context, '/login',
                                          replace: true, clearStack: true);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class MineListItemWidget extends StatelessWidget {
  const MineListItemWidget({
    Key key,
    this.image,
    this.text,
    this.onTab,
    this.rightText,
  }) : super(key: key);
  final String image;
  final String text;
  final String rightText;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height(100),
        margin: EdgeInsets.symmetric(horizontal: width(40)),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffEBEBEB)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Visibility(
                  child: Image.asset(
                      image == "" ? "images/home/avatar.png" : image,
                      fit: BoxFit.fill,
                      width: width(44),
                      height: height(44)),
                  visible: image != "",
                ),
                SizedBox(width: width(28)),
                Text(
                  text,
                  style: TextStyle(fontSize: sp(28), color: Color(0xff323232)),
                ),
              ],
            ),
            Visibility(
              child: Expanded(
                  child: Text(
                rightText == null ? "" : rightText,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: sp(28), color: Color(0xff323232)),
              )),
              visible: rightText != null,
            ),
            Icon(Icons.keyboard_arrow_right_rounded,
                size: sp(40), color: Color(0xffD4D4D4)),
          ],
        ),
      ),
    );
  }
}

class UserHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*       Positioned(
          top: 10,
          left: 10,
          child:
        ),*/

        Container(
          height: height(376) + MediaQuery.of(context).padding.top,
          width: double.infinity,
          // color: kPrimaryColor,
          padding:
              EdgeInsets.symmetric(horizontal: width(40), vertical: height(20)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mine/bg.png'), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: height(40),
              ),
              Image.asset('images/mine/avatar.png',
                  width: width(95), height: height(95)),
              SizedBox(
                width: height(16),
              ),
              Text("Hi，975****@163.com",
                  style: TextStyle(fontSize: sp(32), color: kWhite)),
              /*     Row(
            children: <Widget>[
              Text('UID: 123****1236123',
                  style: TextStyle(fontSize: sp(24), color: kWhite)),
              SizedBox(width: width(20)),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: '复制成功'));
                  Toast.showSuccess('复制成功');
                },
                child: Image.asset('images/mine/copy.png',
                    width: width(33), height: height(33)),
              )
            ],
          ),*/
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width(40)),
            child: Column(
              children: [
                SizedBox(
                  height: height(376),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Card(
                      shadowColor: Color(0xffDEDEDE),
                      elevation: 5,
                      child: GestureDetector(
                        onTap: () => RouterUtil.push(context, MineRouter.auth1),
                        child: Container(
                          height: height(98),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/mine/rz.png'),
                                width: width(56),
                                height: height(56),
                              ),
                              SizedBox(width: width(20)),
                              Text('身份验证',
                                  style: TextStyle(
                                      color: Color(0xff909090),
                                      fontSize: sp(28)))
                            ],
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                      child: Card(
                        shadowColor: Color(0xffDEDEDE),
                        elevation: 5,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () =>
                              RouterUtil.push(context, MineRouter.security),
                          child: Container(
                            height: height(98),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/mine/aq.png'),
                                  width: width(56),
                                  height: height(56),
                                ),
                                SizedBox(width: width(20)),
                                Text('安全中心',
                                    style: TextStyle(
                                        color: Color(0xff909090),
                                        fontSize: sp(28)))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

/// 异形背景
// class BottomClipper extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(0, size.height - 50);

//     var p1 = Offset(size.width / 2, size.height);
//     var p2 = Offset(size.width, size.height - 50);
//     path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
//     path.lineTo(size.width, size.height - 50);
//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return false;
//   }
// }

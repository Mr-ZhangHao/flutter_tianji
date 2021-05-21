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

import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tianji/common/config/global_config.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/event/userInfoEvent.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/common/update/index.dart';
import 'package:flutter_tianji/login/provider/user_provider.dart';
import 'package:flutter_tianji/login/server/index.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/mine/routes/index.dart';
import 'package:flutter_tianji/mine/server/index.dart';
import 'package:flutter_tianji/mine/views/security.dart';
import 'package:flutter_tianji/providers/gloable_provider.dart';
import 'package:flutter_tianji/providers/local_provider.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/routes/routes.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/sp_utils.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MineScreen extends StatefulWidget {
  MineScreen({Key key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  List<Map<String, dynamic>> typeList = [
    {"name": 'btc', "id": 0},
    {"name": 'eth', "id": 1},
    // {"name": '其他证件', "id": 2},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            elevation: 0.5,
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
            /*  InkWell(
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
                  *//*else{
                      Provider.of<LocalProvider>(context,listen: false).switchLocale(1);
                    }*//*
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: width(30)),
                  child: Image.asset('images/mine/ch.png',
                      width: width(80), height: width(48), fit: BoxFit.fill),
                ),
              )*/
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
                            .setCurrIndex(4);
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

                        RouterUtil.push(context, MineRouter.focusUs);
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
                      isVersion: true,
                      isShowBadge:
                          Provider.of<MineProvider>(context, listen: false)
                              .isShowBadge,
                      image: '',
                      rightText: "v ${GlobalConfig.andVersionName}",
                      onTab: () {
                        print(typeList);
                        /*          */
                        Provider.of<MineProvider>(context, listen: false)
                                .isShowBadge
                            ? UpdateUtil().checkVersion(context)
                            : Toast.showText(Tr.of(context).latestVersion);
                        print("object:" +
                            Provider.of<MineProvider>(context, listen: false)
                                .isShowBadge
                                .toString());
                      },
                    ),
                    MineListItemWidget(
                      text: '退出登录',
                      image: '',
                      onTab: () {
                    /*    showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text(Tr.of(context).signOutHint,
                                    style: TextStyle(fontSize: sp(32))),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text(Tr.of(context).cancel),
                                    onPressed: () => RouterUtil.goBack(context),
                                  ),
                                  CupertinoDialogAction(
                                      child: Text(Tr.of(context).determine,
                                          style: TextStyle(
                                              color: Color(0xff909090))),
                                      onPressed: logout),
                                ],
                              );
                            });*/

                        Utils.ShowDialogUtils(
                            context, '${Tr.of(context).signOutHint}',
                            confirm: () {
                              logout();
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

  void logout() async {
    await LoginServer.logout();
    Provider.of<UserProvider>(context, listen: false).setIsLogin(false);
    await SpUtils.sp.clear();
    RouterUtil.push(context, Routes.login, replace: true, clearStack: true);
  }
}

class MineListItemWidget extends StatelessWidget {
  const MineListItemWidget({
    Key key,
    this.image,
    this.text,
    this.onTab,
    this.isShowBadge = false,
    this.isVersion = false,
    this.rightText,
  }) : super(key: key);
  final String image;
  final String text;
  final String rightText;
  final bool isShowBadge;
  final bool isVersion;
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
            Row(
              children: <Widget>[
                Visibility(
                  visible: isShowBadge,
                  child: Container(
                    width: width(12),
                    height: width(12),
                    margin: EdgeInsets.only(right: width(10)),
                    decoration: BoxDecoration(
                      color: Color(0xffF74F4F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                /*  Visibility(
                    visible: isVersion,
                    child: Text(
                      Platform.isAndroid
                          ? GlobalConfig.andVersionName
                          : GlobalConfig.iosVersionName,
                      style:
                          TextStyle(fontSize: sp(28), color: Color(0xff323232)),
                    )) */
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
    return Consumer<MineProvider>(
        builder: (BuildContext context, MineProvider model, Widget child) {
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
            padding: EdgeInsets.symmetric(
                horizontal: width(40), vertical: height(20)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mine/bg.png'), fit: BoxFit.fill)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height(MediaQuery.of(context).padding.top + 100),
                ),
                InkWell(
                  child: model.userInfo == null || model.userInfo.avatar == null
                      ? Image.asset('images/home/avatar.png',
                          width: 50, height: 50)
                      : ClipOval(
                          child: Image.network('${model.userInfo?.avatar}',
                              fit: BoxFit.cover, width: 50, height: 50)),
                  onTap: () {
                    _chooseCamereOrGallery(context);
                  },
                ),
                SizedBox(
                  height: height(5),
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${model.userInfo?.username??""}',
                          style: TextStyle(
                              color: Color(0xffFFFFFF), fontSize: sp(34))),
                      SizedBox(
                        width: width(10),
                      ),
                      Image.asset('images/mine/icon_modify.png',
                          width: width(28), height: height(28))
                    ],
                  ),
                  onTap: () {
                    TextEditingController _textCtr = TextEditingController();
                    Utils.ShowDialogUtils(context, '修改用户名',
                        isvisible: true, textcontroller: _textCtr, confirm: () {
                      _ModifyUserName(context, _textCtr);
                    });
                  },
                ),
                Text(
                    '${model.userInfo?.mobile != "" ? model.userInfo?.mobile : model.userInfo?.email}',
                    style:
                        TextStyle(color: Color(0xffFFFFFF), fontSize: sp(34))),

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
                          onTap: () {
                            if (model.userInfo.kycStatus == 0) {
                              RouterUtil.push(context, MineRouter.auth1);
                            } else {
                              RouterUtil.push(
                                  context, MineRouter.vertifyStatus);
                            }
                          },
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
    });
  }

  /// 拍照
  _takePhoto(context, action) async {
    var image = action == 'camera'
        ? await ImagePicker.pickImage(
            source: ImageSource.camera,
            maxHeight: 800,
            maxWidth: 800,
            imageQuality: 50)
        : await ImagePicker.pickImage(
            source: ImageSource.gallery,
            maxHeight: 800,
            maxWidth: 800,
            imageQuality: 50);
    print("image1:" + image.path);
    if (image != null) {
      print("image2:" + image.path);
      Toast.showLoading('loading...');
      try {
        var response = await MineServer.upLoadImage(image);
        // print('身份证反面$response');
        if (response != null) {
          var avatar = response['data']['fileUrl'];
          await MineServer.setAvatar(avatar);
          Toast.showSuccess('${Tr.of(context).UploadSuccessfully}');
          Provider.of<MineProvider>(context, listen: false).getUserInfo();
        } else {
          Toast.showError('${Tr.of(context).UploadFailed}');
        }
      } catch (e) {
        throw Exception(e);
      }
    } else {
      print("image:" + image.path);
      return;
    }
  }

  _chooseCamereOrGallery(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/mine/camera.png',
                          width: width(56), height: height(50)),
                      SizedBox(width: width(10)),
                      Text("${Tr.of(context).TakePictures}",
                          style: TextStyle(color: Color(0xff323232))),
                    ],
                  ),
                ),
                onTap: () async {
                  _takePhoto(context, 'camera');
                  //  Navigator.pop(context);
                },
              ),
              Divider(
                  height: 1,
                  color: Color(0xffE6E6E6),
                  indent: width(40),
                  endIndent: width(40)),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/mine/galery.png',
                          width: width(56), height: height(50)),
                      SizedBox(width: width(10)),
                      Text("${Tr.of(context).PhotoAlbum}",
                          style: TextStyle(color: Color(0xff323232))),
                    ],
                  ),
                ),
                onTap: () async {
                  _takePhoto(context, 'gallery');
                  //   Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _ModifyUserName(context, _textCtr) async {
    Toast.showLoading('loading...');
    await MineServer.setName(_textCtr.text);
    Toast.showText("修改成功");
    _textCtr.text = '';
    Provider.of<MineProvider>(context, listen: false).getUserInfo();
    Navigator.pop(context);
  }
}

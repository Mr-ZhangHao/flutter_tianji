/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 23:09:08
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 16:48:10
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/identity_auth.dart
*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/common/upload/image_upload.dart';
import 'package:flutter_tianji/core/services/mine.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:image_picker/image_picker.dart';

class IdentityAuthPage extends StatefulWidget {
  IdentityAuthPage({Key key}) : super(key: key);

  @override
  _IdentityAuthPageState createState() => _IdentityAuthPageState();
}

enum LoadType { success, error, waiting, loading }

class _IdentityAuthPageState extends State<IdentityAuthPage> {
  final _readOnlyCtr = TextEditingController();
  final FocusNode _readOnlyFocus = FocusNode();

  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final _numberCtr = TextEditingController();
  final FocusNode _numberFocus = FocusNode();

  LoadType _backLoadType = LoadType.waiting;
  LoadType _frontLoadType = LoadType.waiting;

  dynamic _frontImage;
  dynamic _backImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('身份认证'),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          child: Column(
            children: <Widget>[
              FocusWidget(
                focusNode: _readOnlyFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.right,
                  focusNode: _readOnlyFocus,
                  hintText: '身份证认证',
                  onTab: () {
                    return showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return IdentityTypeWidget(
                          onTab: (type) {
                            print(type);
                            RouterUtil.goBack(context);
                          },
                        );
                      },
                    );
                  },
                  controller: _readOnlyCtr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxHeight: 33,
                  suffixIconConstraintsMaxWidth: 33,
                  suffixIconConstraintsMinHeight: 33,
                  suffixIconConstraintsMinWidth: 33,
                  readOnly: true,
                  suffixIcon: Container(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'images/mine/next.png',
                      width: width(18),
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: height(5)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(
                      '选择认证类型',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _nameFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.right,
                  focusNode: _nameFocus,
                  hintText: '请输入真实姓名',
                  controller: _nameCtr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(
                      '真实姓名：',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _numberFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.right,
                  focusNode: _numberFocus,
                  hintText: '请输入证件号',
                  controller: _numberCtr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(
                      '证件号：',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text('上传证件正面：'),
              ),
              // Container(
              //   height: height(344),
              //   width: width(560),
              //   alignment: Alignment(0, 0.5),
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //     image: AssetImage('images/mine/zheng.png'),
              //     fit: BoxFit.fill,
              //   )),
              //   child: Text('身份证正面照',
              //       style:
              //           TextStyle(color: Color(0xff808080), fontSize: sp(24))),
              // ),
              _cardFrontImage(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text('上传证件反面：'),
              ),
              _cardBackImage(),
              // Container(
              //   height: height(344),
              //   width: width(560),
              //   alignment: Alignment(0, 0.5),
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //     image: AssetImage('images/mine/fan.png'),
              //     fit: BoxFit.fill,
              //   )),
              //   child: Text('身份证反面照',
              //       style:
              //           TextStyle(color: Color(0xff808080), fontSize: sp(24))),
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height(80)),
                child: MyButton(
                  text: '提交',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _handlerCertify() async {
    // if (_usernameValue == null || _usernameValue == '') {
    //   Toast.showText("请填写您的真实姓名");
    // } else if (_idNumValue == null || _idNumValue == '') {
    //   Toast.showText("请填写您的身份证号码");
    // } else if (_frontImage == null || _frontImage == '') {
    //   Toast.showText("请上传身份证正面");
    // } else if (_backImage == null || _backImage == '') {
    //   Toast.showText("请上传身份证反面");
    // } else {
    //   Toast.showLoading('loading...');
    //   await MineServer.userCert(
    //       _usernameValue, _idNumValue, _frontImage, _backImage);
    //   Toast.showText("已提交,请等待审核");
    //   NavigatorUtils.goBackWithParams(context, LoadType.success);
    // }
  }

  Widget _cardBackImage() {
    if (_backLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('back'),
        child: CardImageBaseWidget(
            imageUrl: 'images/mine/fan.png', buttontext: '上传反面'),
      );
    } else if (_backLoadType == LoadType.loading) {
      return CardImageLoadingWidget(
          imageUrl: 'images/mine/fan.png', buttontext: '上传反面');
    } else if (_backLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('back'),
          child: CardImageLoadSuccessWidget(
              imageUrl: _backImage, buttontext: '重新上传'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('back'),
          child: CardImageLoadErrorWidget(
              imageUrl: 'images/mine/fan.png', buttontext: '重新上传'));
    }
  }

  Widget _cardFrontImage() {
    if (_frontLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('front'),
        child: CardImageBaseWidget(
            imageUrl: 'images/mine/zheng.png', buttontext: '上传正面'),
      );
    } else if (_frontLoadType == LoadType.loading) {
      return CardImageLoadingWidget(
          imageUrl: 'images/mine/zheng.png', buttontext: '上传正面');
    } else if (_frontLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadSuccessWidget(
              imageUrl: _frontImage, buttontext: '重新上传'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadErrorWidget(
              imageUrl: 'images/mine/zheng.png', buttontext: '重新上传'));
    }
  }

  _chooseCamereOrGallery(String type) {
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
                      Text("拍照", style: TextStyle(color: Color(0xff323232))),
                    ],
                  ),
                ),
                onTap: () async {
                  _takePhoto(type, 'camera');
                  Navigator.pop(context);
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
                      Text("相册", style: TextStyle(color: Color(0xff323232))),
                    ],
                  ),
                ),
                onTap: () async {
                  _takePhoto(type, 'gallery');
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  /// 拍照
  _takePhoto(type, action) async {
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
    if (image != null) {
      if (type == 'back') {
        setState(() {
          _backLoadType = LoadType.loading;
        });
        try {
          Timer(new Duration(seconds: 4), () {
            // 只在倒计时结束时回调
            // print('身份证反面$response');
            setState(() {
              _backLoadType = LoadType.success;
              // 替换掉网络图片 response.data;
              _backImage =
                  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=246344103,1969471735&fm=26&gp=0.jpg';
            });
            Toast.showSuccess('上传成功');
            // if (response != null) {
            //   Toast.showSuccess('上传成功');
            // } else {
            //   Toast.showError('上传失败');
            // }
          });

          // var response = await MineServer.upLoadImage(image);
          // print('身份证反面$response');
          // if (response != null) {
          //   setState(() {
          //     _backLoadType = LoadType.success;
          //     // 替换掉网络图片 response.data;
          //     _backImage = response.data['data'];
          //   });
          //   Toast.showSuccess('上传成功');
          // } else {
          // _backLoadType = LoadType.success;
          //   Toast.showError('上传失败');
          // }
        } catch (e) {
          setState(() {
            _backLoadType = LoadType.error;
          });
          throw Exception(e);
        }
      } else {
        setState(() {
          _frontLoadType = LoadType.loading;
        });
        try {
          var response = await MineServer.upLoadImage(image);
          print('身份证正面$response');
          if (response != null) {
            setState(() {
              _frontLoadType = LoadType.success;
              // 替换掉网络图片 response.data;
              _frontImage = response.data['data'];
            });
            Toast.showSuccess('上传成功');
          } else {
            setState(() {
              _frontLoadType = LoadType.error;
            });
            Toast.showError('上传失败');
          }
        } catch (e) {
          setState(() {
            _frontLoadType = LoadType.error;
          });
          throw Exception(e);
        }
      }
    } else {
      return;
    }
  }
}

class IdentityTypeWidget extends StatelessWidget {
  final Function(String) onTab;
  const IdentityTypeWidget({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {onTab('1')},
            child: Container(
                child: Text('身份证'),
                width: double.infinity,
                alignment: Alignment.center),
          ),
          Divider(
              color: Color(0xffcccccc),
              height: 0.5,
              indent: width(40),
              endIndent: width(40)),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {onTab('2')},
            child: Container(
                child: Text('护照'),
                width: double.infinity,
                alignment: Alignment.center),
          ),
        ],
      ),
    );
  }
}

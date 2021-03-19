/*
*
*/

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/mine/routes/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

class SharePage extends StatefulWidget {
  SharePage({Key key}) : super(key: key);

  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WrapContainer(
      child: Scaffold(
        backgroundColor: kTransprant,
        appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: kTransprant,
            title: Text(Tr.of(context).inviteFriends,
                style: TextStyle(color: Colors.white)),
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => RouterUtil.goBack(context),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('images/mine/back@2x.png',
                      color: Colors.white,
                      width: width(22),
                      height: height(36)),
                )),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset('images/mine/xiazai@2x.png',
                        color: Colors.white,
                        width: width(48),
                        height: height(48)),
                    onTap: () {
                      RouterUtil.push(context, MineRouter.buddyList);
                    },
                  ),
                  SizedBox(
                    width: width(30),
                  ),
                ],
              )
            ]),
        body: RepaintBoundary(
          key: _globalKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Image.asset('images/mine/shar_bg2.png', fit: BoxFit.fill),
                Positioned(
                  top: width(410),
                  left: width(40),
                  right: width(40),
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.only(bottom: height(50), top: height(90)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //   Text(Tr.of(context).WelcomeRegister, style: TextStyle(fontSize: sp(48), fontWeight: FontWeight.bold)),
                        Container(
                          color: Colors.white,
                          width: width(310),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: height(20)),
                          child: QrImage(
                              data: Provider.of<MineProvider>(context)
                                  .userInfo
                                  .link,
                              size: width(310)),
                        ),
                        SizedBox(height: width(20)),
                        // Text('${Tr.of(context).InvitationCode}:${Provider.of<MineProvider>(context).userInfo.pid.toString()}', style: TextStyle(fontSize: sp(32), color: Color(0xff323232))),
                        SizedBox(height: width(20)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText('邀请码：',
                                fontWeight: FontWeight.bold),
                            Utils.normalText(
                                '${Provider.of<MineProvider>(context).userInfo.pid.toString()}',
                                color: Color(0xffFF3A14),
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: width(20),
                            ),
                            GestureDetector(
                              child: Container(
                                width: width(120),
                                height: height(48),
                                decoration: BoxDecoration(
                                  color: Color(0xffFF3A14),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(width(26))),
                                ),
                                child: Center(
                                  child: Utils.normalText('复制',
                                      color: Colors.white,
                                      fontSize: 24,
                                      textAlign: TextAlign.center),
                                ),
                              ),
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: Provider.of<MineProvider>(context,
                                            listen: false)
                                        .userInfo
                                        .pid
                                        .toString()));
                                Toast.showSuccess(
                                    Tr.of(context).copySuccessfully);
                              },
                            )
                          ],
                        ),
                        SizedBox(height: width(120)),
                        GestureDetector(
                          child: Container(
                            width: width(280),
                            height: height(86),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius:
                                  new BorderRadius.all(new Radius.circular(43)),
                            ),
                            child: Center(
                              child: Utils.normalText('立即分享',
                                  color: Color(0xff7865FE),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          onTap: () async {
                            Map<Permission, PermissionStatus> statuses =
                                await [Permission.storage].request();

                            RenderRepaintBoundary boundary =
                                _globalKey.currentContext.findRenderObject();
                            ui.Image image = await boundary.toImage();
                            ByteData byteData = await image.toByteData(
                                format: ui.ImageByteFormat.png);
                            final result = await ImageGallerySaver.saveImage(
                                byteData.buffer.asUint8List());
                            if (result != null) {
                              Toast.showSuccess(Tr.of(context).SavedAlbum);
                            } else {
                              Toast.showError(Tr.of(context).Savefailed);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WrapContainer extends StatelessWidget {
  final Widget child;
  const WrapContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/mine/shar_bg.png',
              ),
              fit: BoxFit.fill)),
      child: child,
    );
  }
}

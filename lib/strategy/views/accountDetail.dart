import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/mine/mine_screen.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class accountDetailPage extends StatefulWidget {
  final String id;
  accountDetailPage({Key key, this.id}) : super(key: key);

  @override
  _accountDetailPageState createState() => _accountDetailPageState();
}

class _accountDetailPageState extends State<accountDetailPage> {
  String title = '账户详情';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<StrategyProvider>(context, listen: false)
          .getAccountDetail(widget.id);

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Utils.getCommonAppBar(
          context,
          "${title??""}",
          elevation: 0.2,
          /*  actions: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width(150),
                  height: height(60),
                  margin: EdgeInsets.only(right: width(20)),
                  decoration: BoxDecoration(
                      border: new Border.all(
                          color: Color(0xFF7865FE), width: width(2)),
                      borderRadius: new BorderRadius.circular(width(8))),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('usdt ',
                            style: TextStyle(
                              color: Color(0xFF7865FE),
                              fontSize: 12,
                            )),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            )
          ] */
        ),
        body: Consumer<StrategyProvider>(builder:
            (BuildContext context, StrategyProvider model, Widget child) {

              return model.mAccountDetailModel == null
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                  Container(
                    height: height(160),
                    margin: EdgeInsets.symmetric(horizontal: width(30)),
                    child: Row(
                      children: [
                        model.mAccountDetailModel.avatar == null
                            ? Image.asset('images/home/avatar.png',
                                width: 40, height: 40)
                            : ClipOval(
                                child: Image.network(
                                    '${model.mAccountDetailModel.avatar}',
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40)),
                        SizedBox(
                          width: width(30),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Utils.normalText(
                                    model.mAccountDetailModel.username ?? '',
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  width: width(40),
                                ),
                                Utils.normalText(
                                    '${ model.mAccountDetailModel.platform}-' ?? '--'),
                                Utils.normalText(
                                    model.mAccountDetailModel.memo ?? '备注'),
                              ],
                            ),
                            SizedBox(
                              height: height(10),
                            ),
                            Utils.normalText(
                                model.mAccountDetailModel.createTime ?? '',
                                color: Color(0xff999999)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height(160),
                    margin: EdgeInsets.symmetric(horizontal: width(20)),
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F4FA),
                        border: new Border.all(
                            color: Color(0xFFF7F4FA), width: width(2)),
                        borderRadius: new BorderRadius.circular(width(8))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText(
                                model.mAccountDetailModel.follow.toString() ??
                                    '',
                                color: Color(0xffFEA665),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            model.mAccountDetailModel.type == 1
                                ? Utils.normalText('跟随总人数',fontSize: 24)
                                : Utils.normalText('跟随交易员',fontSize: 24),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText(
                                model.mAccountDetailModel.commission
                                        .toString() ??
                                    '',
                                color: Color(0xffFEA665),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            model.mAccountDetailModel.type == 1
                                ? Utils.normalText('跟随佣金',fontSize: 24)
                                : Utils.normalText('跟随收益',fontSize: 24),
                          ],
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: height(160),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText(
                                '${model.mAccountDetailModel.profitRate.toString()}',
                                color: Color(0xff46A578),
                                fontSize: 36),
                            Utils.normalText('收益率'),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText(
                                '${model.mAccountDetailModel.profit.toString()}',
                                color: Color(0xff46A578),
                                fontSize: 36),
                            Utils.normalText('总收益'),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText(
                                '${model.mAccountDetailModel.balance.toString()}',
                                color: Color(0xff46A578),
                                fontSize: 36),
                            Utils.normalText('账户余额'),
                          ],
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: height(20),
                    color: Color(0xffF8F6F9),
                  ),
                    MineListItemWidget2(
                    text: '交易记录',
                    image: 'images/strategy/icon_record.png',
                    onTab: () {
                      RouterUtil.pushResult(
                          context,
                          "${StrategyRouter.tradeRecord}?id=${widget.id}&type=${model.mAccountDetailModel.type}",
                          (result) {});
                    },
                  ),
                    MineListItemWidget2(
                    text: model.mAccountDetailModel.type == 1 ? "跟随者" : "跟随交易员",
                    image: 'images/strategy/icon_gendan.png',
                    onTab: () {
                      RouterUtil.pushResult(
                          context,
                          "${StrategyRouter.genSuiRecord}?id=${widget.id}&type=${model.mAccountDetailModel.type}",
                          (result) {});
                    },
                  ),
                    MineListItemWidget2(
                    text: '更换API',
                    image: 'images/strategy/icon_conversion.png',
                    onTab: () {
                      RouterUtil.pushResult(context,
                          "${StrategyRouter.addBindAccounts}?type=${model.mAccountDetailModel.type == 1 ? 1 : 2}&editorId=${model.mAccountDetailModel.id.toString()}",
                          (result) {
                        RouterUtil.goBack(context);
                      });
                    },
                  ),
                    MineListItemWidget2(
                    text: '解除绑定',
                    image: 'images/strategy/icon_remove.png',
                    onTab: () {
                      Utils.ShowDialogUtils(context,
                          '确认要删除${model.mAccountDetailModel.typeName}的API吗？',
                          confirm: () {
                        _DeleteApi(
                          model.mAccountDetailModel.id,
                        );
                      });
                    },
                  ),
                ]));
        }));
  }

  _DeleteApi(id) async {
    Toast.showLoading('loading...');
    await StrategyServer.getDeleteApi(id);
    Toast.showText("删除成功");
    Navigator.pop(context);
    Provider.of<StrategyProvider>(context, listen: false).getStrategyAccount();
    RouterUtil.goBack(context);
  }
}
class MineListItemWidget2 extends StatelessWidget {
  const MineListItemWidget2({
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
                      width: width(48),
                      height: height(48)),
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
            Image.asset(
              'images/mine/next.png',
              width: width(16),
              height: height(16),
              color: Color(0xffD1D1D1),
            ),
          ],
        ),
      ),
    );
  }
}
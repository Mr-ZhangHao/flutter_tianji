/*
* @message: 主页HOME
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 00:30:00
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/home_screen.dart
*/

import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tianji/baike/model/NewsListModel.dart';
import 'package:flutter_tianji/baike/model/projectListModel.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/event/accountEvent.dart';
import 'package:flutter_tianji/common/event/newsEvent.dart';
import 'package:flutter_tianji/common/event/strategyEvent.dart';
import 'package:flutter_tianji/common/event/userInfoEvent.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/home/provider/index.dart';
import 'package:flutter_tianji/home/routes/index.dart';
import 'package:flutter_tianji/home/widgets/home_widget/banner.dart';
import 'package:flutter_tianji/home/widgets/home_widget/marked_list.dart';
import 'package:flutter_tianji/home/widgets/home_widget/noties.dart';
import 'package:flutter_tianji/home/widgets/home_widget/share_banner.dart';
import 'package:flutter_tianji/login/provider/user_provider.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/mine/routes/index.dart';
import 'package:flutter_tianji/providers/gloable_provider.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/routes/routes.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String avatar;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<MineProvider>(context, listen: false).getUserInfo();
      Provider.of<HomeProvider>(context, listen: false).getBanner();
      Provider.of<HomeProvider>(context, listen: false).getNotices();
      Provider.of<MineProvider>(context, listen: false).getRecommendApi();
      Provider.of<MineProvider>(context, listen: false)
          .getProjectRecommendApi();
      Provider.of<MineProvider>(context, listen: false).getNewsRecommend();
      Provider.of<HomeProvider>(context, listen: false).getranking();
    });

    WallerProvider model1 = Provider.of<WallerProvider>(context, listen: false);
    model1.getBibiAsset();
    model1.getCoinList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Color(0xffF9F8FA),
      //  appBar: homeAppBarWidget(),
      body: SingleChildScrollView(child: Consumer2<MineProvider, HomeProvider>(
          builder: (BuildContext context, MineProvider model,
              HomeProvider model2, Widget child) {
        return Column(
          children: <Widget>[
            Container(
              height: height(530),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  AppBarBanner(child: SwiperBanner()),
                  Container(
                    margin: EdgeInsets.only(
                        left: width(20),
                        right: width(20),
                        top: statusBarHeight-5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (model.userInfo != null &&
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .isLogin) {
                                  RouterUtil.push(context, MineRouter.mine);
                                } else {
                                  RouterUtil.push(context, Routes.login);
                                }
                              },
                              child: Row(
                                children: [
                                  model.userInfo == null ||
                                          model.userInfo.avatar == null
                                      ? Image.asset('images/home/avatar.png',
                                          width: width(60), height: height(60))
                                      : ClipOval(
                                          child: Image.network(
                                              '${model.userInfo?.avatar}',
                                              width: 30,
                                              fit: BoxFit.cover,
                                              height: 30),
                                        ),
                                  SizedBox(
                                    width: width(32),
                                  ),
                                  model.userInfo == null
                                      ? Text(
                                          '未登录',
                                          style: TextStyle(
                                              color: kWhite, fontSize: sp(28)),
                                        )
                                      : Text('${model.userInfo?.username}',
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontSize: sp(28))),
                                ],
                              ),
                            )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            RouterUtil.push(context, HomeRouter.search);
                          },
                          child: Container(
                            height: width(60),
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(width(30))),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width(22),
                                ),
                                Image.asset(
                                  'images/home/search.png',
                                  width: width(28),
                                  height: height(28),
                                ),
                                SizedBox(
                                  width: width(22),
                                ),
                                Text(
                                  '搜索',
                                  style: TextStyle(
                                      color: Color(0xffB8B8B8),
                                      fontSize: sp(26)),
                                ),
                              ],
                            ),
                          ),
                        )),
                        IconButton(
                          color: Color(0xff323232),
                          icon: ImageIcon(
                            AssetImage(
                              'images/home/server.png',
                            ),
                            color: Color(0XFFFFFFFF),
                          ),
                          onPressed: () {
                            if (model.userInfo != null) {
                              print('chatUrl:' + model.userInfo.chatUrl);
                              RouterUtil.goWebViewPage(
                                  context,
                                  Tr.of(context).homeCustomerService,
                                  model.userInfo.chatUrl);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width(40), right: width(40)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(300),
                        ),
                        Container(
                          height: height(80),
                          child: NoticesBarWidget(),
                        ),

                        _homeTabWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            /*      GestureDetector(
                //  onTap: () => RouterUtil.push(context, MineRouter.share),
                child: ShareBanner()),*/
            _PolicyRecommended(model.recommendList),
            SizedBox(
              height: height(20),
            ),
            //   _rankinglist(model2),
            _Project(model.projectList),
            SizedBox(
              height: height(20),
            ),
            _course(),
            SizedBox(
              height: height(20),
            ),
            _news(model.newsList),
            SizedBox(
              height: height(20),
            ),
          ],
        );
      })),
    );
  }

  _rankinglist(HomeProvider model) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))), //设置圆角
        margin: EdgeInsets.only(left: width(40), right: width(40)),
        child: Padding(
          padding: EdgeInsets.all(width(30)),
          child: Column(children: [
            Row(
              children: [
                Container(
                  width: width(4),
                  height: height(30),
                  color: Colors.black,
                ),
                SizedBox(
                  width: width(20),
                ),
                Expanded(
                  child: Text(
                    '排行榜',
                    style: TextStyle(
                        color: Color(0xff323232),
                        fontSize: sp(32),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    '更多',
                    style: TextStyle(color: kPrimaryColor, fontSize: sp(24)),
                  ),
                  onTap: () {
                    RouterUtil.push(context, HomeRouter.rankings);
                  },
                ),
                SizedBox(
                  width: width(10),
                ),
                Image.asset('images/home/more.png',
                    width: width(28), height: height(28)),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height(50),
                    ),
                    rankWidget(
                        2,
                        '${model.ranking != null && model.ranking.length > 2 ? model.ranking[1].avatar : ''}',
                        '${model.ranking != null && model.ranking.length > 1 ? model.ranking[1].username : ''}',
                        '${model.ranking != null && model.ranking.length > 1 ? model.ranking[1].rate : ''}%',
                        Color(0xff4530D7),
                        Color(0xff280E91)),
                  ],
                ),
                SizedBox(
                  width: width(24),
                ),
                rankWidget(
                    1,
                    '${model.ranking != null && model.ranking.length > 2 ? model.ranking[0].avatar : ''}',
                    '${model.ranking != null && model.ranking.length > 0 ? model.ranking[0].username : ''}',
                    '${model.ranking != null && model.ranking.length > 0 ? model.ranking[0].rate : ''}%',
                    Color(0xff6F22BE),
                    Color(0xff5B00B8)),
                SizedBox(
                  width: width(24),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height(50),
                    ),
                    rankWidget(
                        3,
                        '${model.ranking != null && model.ranking.length > 2 ? model.ranking[2].avatar : ''}',
                        '${model.ranking != null && model.ranking.length > 2 ? model.ranking[2].username : ''}',
                        '${model.ranking != null && model.ranking.length > 2 ? model.ranking[2].rate : ''}%',
                        Color(0xffC86F2F),
                        Color(0xffCC3800))
                  ],
                ),
              ],
            ),
          ]),
        ));
  }

  //排行榜
  Widget rankWidget(type, image, text, number, textColor, numbuerColor) {
    return Container(
      alignment: Alignment.center,
      height: height(244),
      width: width(184),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: type == 1
                ? AssetImage("images/wallet/rank1.png")
                : type == 2
                    ? AssetImage("images/wallet/rank2.png")
                    : AssetImage("images/wallet/rank3.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          SizedBox(
            height: height(55),
          ),
          Container(
            width: width(60),
            height: height(60),
            child: image == ''
                ? Image.asset('images/mine/avatar.png')
                : Image.network(image),
          ),
          SizedBox(
            height: height(50),
          ),
          Utils.normalText('${text}', fontSize: 24, color: textColor),
          Utils.normalText('${number}', fontSize: 24, color: numbuerColor),
        ],
      ),
    );
  }

  //策略
  _PolicyRecommended(List<strategyListModel> data) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // 底色
      /*    boxShadow: [
            BoxShadow(
              blurRadius: width(4), //阴影范围
              spreadRadius: width(1), //阴影浓度
              color: Color(0xffF2EAF3), //阴影颜色
            ),
          ],*/
        ),
        child: Padding(
          padding: EdgeInsets.only(top: width(30)),
          child: Column(
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(left: width(30), right: width(30)),
                  child: Row(

                    children: [
                      Container(
                        width: width(5),
                        height: height(25),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: width(15),
                      ),
                      Expanded(
                        child: Text(
                          '策略推荐',
                          style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: sp(30),
                              height: 1.1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '更多',
                            style: TextStyle(
                              height: 1.1,
                                color: Color(0xff909090), fontSize: sp(28)),
                          ),
                          SizedBox(
                            width: width(10),
                          ),
                          Image.asset(
                            'images/mine/next.png',
                            width: width(10),
                            height: height(17),
                            color: Color(0xffD1D1D1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Provider.of<GloableProvider>(context, listen: false)
                      .setCurrIndex(2);
                },
              ),
              Container(
                height: height(260),
                child: data.length == 0
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'images/business/no_task.png',
                              width: width(160),
                              height: height(160),
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: height(20)),
                            Text('${Tr.of(context).homeNodata}',
                                style: TextStyle(color: Color(0xffDBDBDB)))
                          ],
                        ),
                      )
                    : Container(
                        child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: Swiper(
                              autoplay: false,
                              itemCount: data.length > 3 ? 3 : data.length,
                              autoplayDisableOnInteraction: true,
                              autoplayDelay: 5000,
                              duration: 1000,
                              pagination: new SwiperPagination(),
                              viewportFraction: 0.92,
                              scale: 0.96,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    margin: EdgeInsets.only(
                                        top: width(24), bottom: width(24)),
                                    padding: EdgeInsets.all(width(20)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(width(8)),
                                          bottomRight:
                                              Radius.circular(width(8)),
                                          topLeft: Radius.circular(width(8)),
                                          topRight: Radius.circular(width(8)),
                                        ),
                                        color: Color(0xffF4F7FD)
                                        /*     border: Border.all(
                                              color: Color(0xff999999),
                                              width: 0.5
                                          )*/
                                        ),
                                    width: width(600),
                                    child: GestureDetector(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                data[index].avatar == null
                                                    ? Image.asset(
                                                        'images/home/icon_quantify.png',
                                                        width: 40,
                                                        height: 40)
                                                    : ClipOval(
                                                        child: Image.network(
                                                            '${data[index].avatar}',
                                                            fit: BoxFit.cover,
                                                            width: 40,
                                                            height: 40)),
                                                SizedBox(
                                                  width: width(20),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Utils.normalText(
                                                            '${data[index].username ?? ""}',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        SizedBox(
                                                          width: width(20),
                                                        ),
                                                        Visibility(
                                                          child: Container(
                                                            width: width(104),
                                                            height: height(32),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                  top:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xffD45151),
                                                                    width: 0.5,
                                                                  ),
                                                                  bottom:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xffD45151),
                                                                    width: 0.5,
                                                                  ),
                                                                  left:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xffD45151),
                                                                    width: 0.5,
                                                                  ),
                                                                  right:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xffD45151),
                                                                    width: 0.5,
                                                                  )),
                                                              color: Color(
                                                                  0xffFFBBBB),
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          width(8)),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                      width(8)),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                      width(8))),
                                                            ),
                                                            child: Text('平台优选',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        sp(22),
                                                                    color: Color(
                                                                        0xffD91616))),
                                                          ),
                                                          visible: data[index]
                                                                  .is_recommend ==
                                                              1,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Utils.normalText(
                                                            '${data[index].platform ?? ''}交易所',
                                                            fontSize: 24,
                                                            color:
                                                            Color(0xff999999)),
                                                        Container(
                                                          width: width(280),
                                                        ),
                                                        Utils.normalText(
                                                            '热度 +100',
                                                            fontSize: 24,
                                                            color:
                                                            Color(0xffFF6D01))

                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Expanded(child: Text('')),
                                              /*  Visibility(
                                                  child: GestureDetector(
                                                    child: Container(
                                                      width: width(120),
                                                      height: height(50),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff7865FE),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    44)),
                                                      ),
                                                      child: Text('跟随',
                                                          style: TextStyle(
                                                              fontSize: sp(24),
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                    onTap: () {
                                                      Toast.showLoading(
                                                          'loading...');
                                                      Provider.of<StrategyProvider>(
                                                              context,
                                                              listen: false)
                                                          .getnoFollowList(
                                                              data[index].id,
                                                              data[index]
                                                                  .platformId);
                                                      *//*  Provider.of<StrategyProvider>(context, listen: false)
                            .getStrategyDetail(data[index].id);*//*
                                                      Provider.of<StrategyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .coinList =
                                                          data[index].coin;
                                                      //延时500毫秒执行
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  1500), () {
                                                        //延时执行的代码
                                                        RouterUtil.pushResult(
                                                            context,
                                                            "${StrategyRouter.genDan}?type=${1}&apiId=${data[index].id}&platformID=${data[index].platformId}",
                                                            (result) {});
                                                      });
                                                    },
                                                  ),
                                                  visible: Provider.of<
                                                                      StrategyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .strategyAccount !=
                                                          null &&
                                                      Provider.of<StrategyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .strategyAccount
                                                              .length >
                                                          0 &&
                                                      Provider.of<StrategyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .strategyAccount[
                                                                  0]
                                                              .type !=
                                                          1,
                                                )*/
                                              ],
                                            ),
                                            SizedBox(
                                              height: height(40),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Utils.normalText(
                                                        '${data[index].profitRate ?? 0}%',
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffFEA665)),
                                                    SizedBox(
                                                      height: height(20),
                                                    ),
                                                    Utils.normalText('收益率',
                                                        fontSize: 24),
                                                  ],
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Utils.normalText(
                                                        '${data[index].profit ?? 0}%',
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffFEA665)),
                                                    SizedBox(
                                                      height: height(20),
                                                    ),
                                                    Utils.normalText(
                                                        '总收益(USDT)',
                                                        fontSize: 24),
                                                  ],
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Utils.normalText(
                                                        '${data[index].count ?? 0}',
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffFEA665)),
                                                    SizedBox(
                                                      height: height(20),
                                                    ),
                                                    Utils.normalText('跟随人数',
                                                        fontSize: 24),
                                                  ],
                                                )),
                                              ],
                                            )
                                          ],
                                        ),
                                        onTap: () {
                                          RouterUtil.pushResult(
                                              context,
                                              "${StrategyRouter.strategyOrderDetail}?apiId=${data[index].id}",
                                              (result) {});
                                        }));
                              },
                              /*  pagination: SwiperPagination(
                                  alignment: Alignment(-0, 1.23),
                                  // alignment: Alignment(-0, 1.65),
                                  builder: DotSwiperPaginationBuilder(
                                    size: width(15),
                                    activeSize: width(15),
                                    activeColor: kPrimaryColor,
                                    color: Color(0xffD2D2D2),
                                    space: width(10),
                                  )),*/
                            ))),
              )
            ],
          ),
        ));
  }

  //tab
  _homeTabWidget() {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        border: Border(top: BorderSide(color: Color(0xffEAEAEA),width:width(1))),

     /*   boxShadow: [
          BoxShadow(
            blurRadius: width(4), //阴影范围
            spreadRadius: width(1), //阴影浓度
            color: Color(0xffF2EAF3), //阴影颜色
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),*/
      ),
      child: Padding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      Provider.of<GloableProvider>(context, listen: false)
                          .setCurrIndex(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/home/tab1.png',
                          width: width(48), height: height(48)),
                      SizedBox(
                        height: height(20),
                      ),
                      Container(
                        child: Text('热门项目',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff323232),
                                fontSize: sp(20),
                                height: 1.1)),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Provider.of<GloableProvider>(context, listen: false)
                        .setCurrIndex(2);
                    /*        Application.eventBus
                        .fire(newsEvent());*/
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/home/tab2.png',
                          width: width(48), height: height(48)),
                      SizedBox(
                        height: height(20),
                      ),
                      Container(
                        child: Text('量化交易',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff323232),
                                fontSize: sp(20),
                                height: 1.1)),
                      )
                    ],
                  ),
                )),

            Expanded(
              flex: 1,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                /*          onTap: () =>
                           RouterUtil.push(context, WalletRouter.transformation),*/
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/home/tab3.png',
                        width: width(48), height: height(48)),
                    SizedBox(
                      height: height(20),
                    ),
                    Container(
                      child: Text('我的课程',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: sp(20),
                              height: 1.1)),
                    ),
                  ],
                ),
                onTap: () {
                  Provider.of<GloableProvider>(context, listen: false)
                      .setCurrIndex(3);
                  //Application.eventBus.fire(strategyEvent());
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                /*          onTap: () =>
                           RouterUtil.push(context, WalletRouter.transformation),*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/home/tab4.png',
                        width: width(48), height: height(48)),
                    SizedBox(
                      height: height(20),
                    ),
                    Container(
                      child: Text('邀请好友',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: sp(20),
                              height: 1.1)),
                    ),
                  ],
                ),
                onTap: () {
                  RouterUtil.push(context, MineRouter.share);
                },
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: height(20), bottom: height(20)),
      ),
    );
  }

  // course 优质课程

  _course() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // 底色
/*          boxShadow: [
            BoxShadow(
              blurRadius: width(4), //阴影范围
              spreadRadius: width(1), //阴影浓度
              color: Color(0xffF2EAF3), //阴影颜色
            ),
          ],*/
        ),
        child: Padding(
            padding: EdgeInsets.only(top: width(20)),
            child: Column(
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: width(30), right: width(30)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width(5),
                              height: height(25),
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: width(15),
                            ),
                            Expanded(
                              child: Text(
                                '优质课程',
                                style: TextStyle(
                                    height: 1.1,

                                    color: Color(0xff323232),
                                    fontSize: sp(30),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            /*  Text(
                          '更多',
                          style:
                          TextStyle(color: Color(0xff909090), fontSize: sp(28)),
                        ),
                        SizedBox(
                          width: width(10),
                        ),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(10),
                          height: height(17),
                          color: Color(0xffD1D1D1),
                        ),*/
                          ],
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        Divider(
                          color: Color(0xffEAEAEA),
                          height: height(1),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child:Container(
                      child:  GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          //水平子Widget之间间距
                          crossAxisSpacing: width(15),
                          //垂直子Widget之间间距
                          mainAxisSpacing: width(15),
                          //GridView内边距
                          //一行的Widget数量
                          crossAxisCount: 2,
                          //子Widget宽高比例
                          childAspectRatio: 1.4,
                          //子Widget列表
                          children:getWidgetList()
                      ),
                      height: height(500),
                    ),)
              ],
            )));
  }
  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i.toString());
    }
    return list;
  }
  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset('images/home/course_debug_bg.png',width: width(330),height: height(180),),
          SizedBox(height: height(10),),
          Container(
            width: width(330),
            child: Text(
                '${ '手把手教你如何掌握买币……'}',
                maxLines: 1,
                style: TextStyle(fontSize: sp(28)),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
  // news 新闻资讯

  _news(List<NewsListModel> model) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // 底色
       /*   boxShadow: [
            BoxShadow(
              blurRadius: width(4), //阴影范围
              spreadRadius: width(1), //阴影浓度
              color: Color(0xffF2EAF3), //阴影颜色
            ),
          ],*/
        ),
        child: Padding(
            padding: EdgeInsets.only(top: width(20)),
            child: Column(
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: width(30), right: width(30)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width(5),
                              height: height(25),
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: width(15),
                            ),
                            Expanded(
                              child: Text(
                                '热门资讯',
                                style: TextStyle(
                                    height: 1.1,
                                    color: Color(0xff323232),
                                    fontSize: sp(30),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            /*  Text(
                          '更多',
                          style:
                          TextStyle(color: Color(0xff909090), fontSize: sp(28)),
                        ),
                        SizedBox(
                          width: width(10),
                        ),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(10),
                          height: height(17),
                          color: Color(0xffD1D1D1),
                        ),*/
                          ],
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        Divider(
                          color: Color(0xffEAEAEA),
                          height: height(1),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model != null
                            ? model[0].journalism.length > 3
                                ? 3
                                : model[0].journalism.length
                            : 0,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Color(0xffF1F1F1)))),
                              height: height(200),
                              child: ListTile(
                                title: Utils.normalText(
                                    '${model[0].journalism[index].title}',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                                subtitle: Container(
                                  margin: EdgeInsets.only(top: height(30)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Utils.normalText(
                                          '${model[0].journalism[index].tag}',
                                          color: Color(0xffC0C0C0),
                                          fontSize: 24),
                                      Utils.normalText(
                                          '${model[0].journalism[index].createdAt}',
                                          color: Color(0xffC0C0C0),
                                          fontSize: 24)
                                    ],
                                  ),
                                ),
                                trailing: Container(
                                  width: width(200),
                                  height: height(140),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width(5))),
                                      color: kWhite),
                                  child: Image.network(
                                    '${model[0].journalism[index].images}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              RouterUtil.goWebViewPage2(
                                  context,
                                  model[0].journalism[index].title,
                                  model[0].journalism[index].descript,
                                  model[0].journalism[index].tag,
                                  model[0].journalism[index].createdAt,
                                  model[0].journalism[index].images);
                            },
                          );
                        }))
              ],
            )));
  }

  // Project 项目推荐

  _Project(List<projectListModel> model) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // 底色
     /*     boxShadow: [
            BoxShadow(
              blurRadius: width(4), //阴影范围
              spreadRadius: width(1), //阴影浓度
              color: Color(0xffF2EAF3), //阴影颜色
            ),
          ],*/
        ),
        child: Padding(
            padding: EdgeInsets.only(top: width(20)),
            child: Column(
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: width(30), right: width(30)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width(5),
                              height: height(25),
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: width(15),
                            ),
                            Expanded(
                              child: Text(
                                '项目推荐',
                                style: TextStyle(
                                    height: 1.1,

                                    color: Color(0xff323232),
                                    fontSize: sp(30),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '更多',
                              style: TextStyle(
                                  height: 1.1,

                                  color: Color(0xff909090), fontSize: sp(28)),
                            ),
                            SizedBox(
                              width: width(10),
                            ),
                            Image.asset(
                              'images/mine/next.png',
                              width: width(10),
                              height: height(17),
                              color: Color(0xffD1D1D1),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        Divider(
                          color: Color(0xffEAEAEA),
                          height: height(1),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Provider.of<GloableProvider>(context, listen: false)
                        .setCurrIndex(2);
                  },
                ),
                MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.length > 3 ? 3 : model.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            highlightColor: Colors.transparent,
                            radius: 0.0,
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: height(290),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: width(1), color: Color(0xffEAEAEA)))),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: width(30),),
                                      Image.asset('images/home/project_debug_bg.png',fit: BoxFit.fill
                                        ,width: width(180),
                                        height: height(230),),
                                      Expanded(child:  ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Utils.normalText("${model[index].name}",
                                                textAlign: TextAlign.left),
                                            Stack(
                                              children: [
                                               Positioned(child:  Container(
                                                 height: height(12),
                                                 width: width(32),
                                                 color: Color(0xffFC9F61),
                                               ),
                                               bottom: 1,),
                                                Utils.normalText(
                                                  "${model[index].level=="未评级"? "":model[index].level }",
                                                  fontSize: 32,
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Container(
                                              width: double.maxFinite,
                                              alignment: Alignment.centerLeft,
                                              height: height(110),
                                              child:  Text(
                                                'ET作为一个去中心化的应用平台，其目的就是为了降低开发者的门槛，致力于打造一个易于使用、功能完备、即插即用的系统。',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                style: TextStyle(
                                                    fontSize: sp(24),
                                                    color: Color(0xff646464)
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: height(10),),
                                            Row(
                                              children: [
                                                Utils.normalText("热度：${model[index].score}",
                                                    fontSize: 24,
                                                    textAlign: TextAlign.left),
                                                SizedBox(width: width(40),),
                                                Utils.normalText(

                                                  "+${model[index].rate.toString()}%",
                                                  fontSize: 24,
                                                  color: Color(0XFFFF4E4E),
                                                  textAlign: TextAlign.center,),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),

                                ],
                              )
                            ),
                            onTap: () {
                              RouterUtil.pushResult(
                                  context,
                                  "${BaikeRouter.projectDetils}?type=${model[index].id}",
                                  (result) {});
                            },
                          );
                        }))
              ],
            )));
  }
}

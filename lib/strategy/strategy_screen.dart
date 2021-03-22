import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

// 项目百科
enum strategyType {
  // 策略跟单
  Strategy,
  // 我的账户
  Account
}

class strategyScreen extends StatefulWidget {
  @override
  _strategy_screenState createState() => _strategy_screenState();
}

class _strategy_screenState extends State<strategyScreen> {
  strategyType assetsType = strategyType.Strategy;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<StrategyProvider>(context, listen: false)
          .getStrategyList(type: 1);
      Provider.of<StrategyProvider>(context, listen: false)
          .getStrategyList(type: 2);
      Provider.of<StrategyProvider>(context, listen: false)
          .getStrategyList(type: 3);
      Provider.of<StrategyProvider>(context, listen: false)
          .getStrategyAccount();
      Provider.of<StrategyProvider>(context, listen: false).getCoinsList();
      Provider.of<StrategyProvider>(context, listen: false).getPlatformsList();
      Provider.of<StrategyProvider>(context, listen: false).getStrategyType();
      /*   if (GlobalConfig.isTimer) {
        timer = Timer.periodic(Duration(seconds: 20), (timer) {
          Provider.of<HomeProvider>(context, listen: false).getData();
        });
      } else {
        Provider.of<HomeProvider>(context, listen: false).getData();
      }*/
    });
  }

  void _aActiveChanged() {
    setState(() {
      assetsType = strategyType.Strategy;
    });
  }

  void _aActiveChanged1() {
    setState(() {
      assetsType = strategyType.Account;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBarWidget(),
        backgroundColor: Color(0xffF9F8FA),
        body: assetsType == strategyType.Strategy
            ? SingleChildScrollView(child: Consumer<StrategyProvider>(builder:
                (BuildContext context, StrategyProvider model, Widget child) {
                return Container(
                  color: Color(0xffFFFFFF),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width(40)),
                            height: height(98),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  height: height(40),
                                  width: width(6),
                                  color: Color(0xff323232),
                                ),
                                SizedBox(
                                  width: width(20),
                                ),
                                Expanded(
                                  child: Text(
                                    'USDT合约',
                                    style: TextStyle(
                                        color: Color(0xff323232),
                                        fontSize: sp(32),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    '更多',
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: sp(24)),
                                  ),
                                  onTap: () {
                                    RouterUtil.push(
                                        context, StrategyRouter.allStrategy);
                                  },
                                ),
                                SizedBox(
                                  width: width(10),
                                ),
                                Image.asset('images/home/more.png',
                                    width: width(28), height: height(28)),
                              ],
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width(40)),
                              constraints: BoxConstraints(
                                minHeight: height(270),
                                maxHeight: height(830),
                              ),
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: model.coinInfoList1.length > 3
                                      ? 3
                                      : model.coinInfoList1.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _strategyItem(
                                        model.coinInfoList1, index);
                                  })),
                        ],
                      ),
                      Container(
                        height: height(20),
                        color: Color(0xffF8F6F9),
                      ),
                      Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width(40)),
                            height: height(98),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  height: height(40),
                                  width: width(6),
                                  color: Color(0xff323232),
                                ),
                                SizedBox(
                                  width: width(20),
                                ),
                                Expanded(
                                  child: Text(
                                    '币本合约',
                                    style: TextStyle(
                                        color: Color(0xff323232),
                                        fontSize: sp(32),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    '更多',
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: sp(24)),
                                  ),
                                  onTap: () {
                                    RouterUtil.push(
                                        context, StrategyRouter.allStrategy);
                                  },
                                ),
                                SizedBox(
                                  width: width(10),
                                ),
                                Image.asset('images/home/more.png',
                                    width: width(28), height: height(28)),
                              ],
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width(40)),
                              constraints: BoxConstraints(
                                minHeight: height(270),
                                maxHeight: height(830),
                              ),
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: model.coinInfoList2.length > 3
                                      ? 3
                                      : model.coinInfoList2.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _strategyItem(
                                        model.coinInfoList2, index);
                                  })),
                        ],
                      ),
                      Container(
                        height: height(20),
                        color: Color(0xffF8F6F9),
                      ),
                      Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width(40)),
                            height: height(98),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  height: height(40),
                                  width: width(6),
                                  color: Color(0xff323232),
                                ),
                                SizedBox(
                                  width: width(20),
                                ),
                                Expanded(
                                  child: Text(
                                    '币币现货',
                                    style: TextStyle(
                                        color: Color(0xff323232),
                                        fontSize: sp(32),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    '更多',
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: sp(24)),
                                  ),
                                  onTap: () {
                                    RouterUtil.push(
                                        context, StrategyRouter.allStrategy);
                                  },
                                ),
                                SizedBox(
                                  width: width(10),
                                ),
                                Image.asset('images/home/more.png',
                                    width: width(28), height: height(28)),
                              ],
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width(40)),
                              constraints: BoxConstraints(
                                minHeight: height(270),
                                maxHeight: height(830),
                              ),
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: model.coinInfoList3.length > 3
                                      ? 3
                                      : model.coinInfoList3.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _strategyItem(
                                        model.coinInfoList3, index);
                                  })),
                        ],
                      ),
                    ],
                  ),
                );
              }))
            : Consumer<StrategyProvider>(builder:
                (BuildContext context, StrategyProvider model, Widget child) {
                return model.strategyAccount != null &&
                        model.strategyAccount.length > 0
                    ? _accountPage(model)
                    : Container(
                        color: Color(0xffffffff),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/strategy/nobind.png',
                                fit: BoxFit.fitWidth,
                                width: width(150),
                                height: height(150),
                              ),
                              SizedBox(height: height(12)),
                              Utils.normalText(
                                '您未绑定账户',
                              ),
                              SizedBox(height: height(42)),
                              Container(
                                width: width(360),
                                height: height(88),
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  color: Color(0xFF7865FE), // 底色
                                  borderRadius: new BorderRadius.circular(
                                      width(48)), // 圆角度
                                ),
                                child: GestureDetector(
                                  child: Center(
                                    child: Text("绑定账户",
                                        style: TextStyle(
                                            fontSize: sp(28), color: kWhite)),
                                  ),
                                  onTap: () {
                                    RouterUtil.push(context,
                                        StrategyRouter.bindingAccounts);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              }));
  }

  double x;
  double y;
  //账户条目
  _accountPage(StrategyProvider model) {
    return ListView.builder(
        //   shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.strategyAccount.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: Card(
                  child: Container(
                      margin: EdgeInsets.all(width(20)),
                      height: height(240),
                      child: Column(children: [
                        Row(children: [
                          model.strategyAccount[index].avatar != null
                              ? ClipOval(
                                  child: Image.network(
                                      '${model.strategyAccount[index].avatar}',
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40))
                              : Image.asset('images/home/avatar.png',
                                  width: 40, height: 40),
                          SizedBox(
                            width: width(30),
                          ),
                          Utils.normalText(
                              model.strategyAccount[index].username ?? '',
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: width(20),
                          ),
                          Utils.normalText(
                              model.strategyAccount[index].typeName ?? '',
                              color: Color(0xff7865FE),
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: width(40),
                          ),
                          Utils.normalText(
                              model.strategyAccount[index].memo ?? '备注'),
                          Expanded(child: Text('')),
                          GestureDetector(
                            child: Icon(
                              Icons.more_horiz,
                              color: Color(0xff7865FE),
                            ),
                            onPanDown: (details) {
                              x = details.globalPosition.dx;
                              y = details.globalPosition.dy;
                            },
                            onTap: () {
                              TextEditingController _textCtr =
                                  TextEditingController();
                              showMenu(
                                  context: context,
                                  position: RelativeRect.fromLTRB(x, y,
                                      MediaQuery.of(context).size.width - x, 0),
                                  items: [
                                    PopupMenuItem(
                                      value: "1",
                                      child: Utils.normalText("修改备注"),
                                    ),
                                    PopupMenuItem(
                                      value: "2",
                                      child: Utils.normalText("删除API"),
                                    ),
                                    PopupMenuItem(
                                      value: "3",
                                      child: Utils.normalText("授权续期"),
                                    ),
                                  ]).then((value) => {
                                    if (value == '1')
                                      {
                                        Utils.ShowDialogUtils(context, '修改备注',
                                            isvisible: true,
                                            textcontroller: _textCtr,
                                            confirm: () {
                                          _ModifyNote(
                                              model.strategyAccount[index].id,
                                              _textCtr.text);
                                        })
                                      }
                                    else if (value == '2')
                                      {
                                        Utils.ShowDialogUtils(
                                            context, '确认要删除OKEX-glxh的API吗？',
                                            confirm: () {
                                          _DeleteApi(
                                            model.strategyAccount[index].id,
                                          );
                                        })
                                      }
                                    else if (value == '3')
                                      {}
                                  });
                            },
                          )
                        ]),
                        SizedBox(
                          height: height(40),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Utils.normalText('跟随人数',
                                      fontSize: 24, color: Color(0xff999999)),
                                  SizedBox(
                                    height: height(20),
                                  ),
                                  Utils.normalText(
                                    model.strategyAccount[index].count
                                            .toString() ??
                                        '0.00',
                                    fontSize: 28,
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Utils.normalText(
                                      model.strategyAccount[index].type == 1
                                          ? '跟随佣金'
                                          : '跟随收益',
                                      fontSize: 24,
                                      color: Color(0xff999999)),
                                  SizedBox(
                                    height: height(20),
                                  ),
                                  Utils.normalText(
                                      model.strategyAccount[index].profit
                                              .toString() ??
                                          '0.00',
                                      fontSize: 28,
                                      color: Color(0xffFF0000)),
                                ],
                              )),
                            ])
                      ]))),
              onTap: () {
                RouterUtil.pushResult(
                    context,
                    "${StrategyRouter.accountDetail}?id=${model.strategyAccount[index].id.toString()}",
                    (result) {});
                //  RouterUtil.push(context, StrategyRouter.accountDetail);
              });
        });
  }

  _ModifyNote(id, memo) async {
    Toast.showLoading('loading...');
    await StrategyServer.getUpdateApiMemo(id, memo);
    Toast.showText("修改成功");
    RouterUtil.goBack(context);
    Provider.of<StrategyProvider>(context, listen: false).getStrategyAccount();
  }

  _DeleteApi(id) async {
    Toast.showLoading('loading...');
    await StrategyServer.getDeleteApi(id);
    Toast.showText("删除成功");
    RouterUtil.goBack(context);
    Provider.of<StrategyProvider>(context, listen: false).getStrategyAccount();
  }

  //策略条目
  _strategyItem(List<strategyListModel> data, int index) {
    return GestureDetector(
        child: Container(
          // 下边框
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xffEAEAEA)))),
          height: height(250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  data[index].avatar == null
                      ? Image.asset('images/home/icon_quantify.png',
                          width: 40, height: 40)
                      : ClipOval(
                          child: Image.network('${data[index].avatar}',
                              fit: BoxFit.cover, width: 40, height: 40)),
                  SizedBox(
                    width: width(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Utils.normalText('${data[index].username ?? ""}',
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: width(20),
                          ),
                          Visibility(
                            child: Container(
                              width: width(104),
                              height: height(32),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffFFBBBB),
                                border: Border(
                                    top: BorderSide(
                                      color: Color(0xffD45151),
                                      width: 0.5,
                                    ),
                                    bottom: BorderSide(
                                      color: Color(0xffD45151),

                                      width: 0.5,
                                    ),
                                    left: BorderSide(
                                      color: Color(0xffD45151),

                                      width: 0.5,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xffD45151),

                                      width: 0.5,
                                    )),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Text('平台优选',
                                  style: TextStyle(
                                      fontSize: sp(22),
                                      color: Color(0xffD91616))),
                            ),
                            visible: data[index].is_recommend == 1,
                          )
                        ],
                      ),
                      Utils.normalText('${data[index].platform ?? ''}交易所',
                          fontSize: 24, color: Color(0xff999999)),
                    ],
                  ),
                  Expanded(child: Text('')),
                  Visibility(
                    child: GestureDetector(
                      child: Container(
                        width: width(160),
                        height: height(70),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff7865FE),
                          borderRadius: BorderRadius.all(Radius.circular(44)),
                        ),
                        child: Text('跟随',
                            style: TextStyle(
                                fontSize: sp(24), color: Colors.white)),
                      ),
                      onTap: () {
                        Toast.showLoading('loading...');
                        Provider.of<StrategyProvider>(context, listen: false)
                            .getnoFollowList(
                                data[index].id, data[index].platformId);
                        Provider.of<StrategyProvider>(context, listen: false)
                            .getStrategyDetail(data[index].id);
                        //延时500毫秒执行
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          //延时执行的代码
                          RouterUtil.pushResult(
                              context,
                              "${StrategyRouter.genDan}?type=${1}&apiId=${data[index].id}&platformID=${data[index].platformId}",
                              (result) {});
                        });
                      },
                    ),
                    visible: Provider.of<StrategyProvider>(context,
                                    listen: false)
                                .strategyAccount !=
                            null &&
                        Provider.of<StrategyProvider>(context, listen: false)
                                .strategyAccount
                                .length >
                            0 &&
                        Provider.of<StrategyProvider>(context, listen: false)
                                .strategyAccount[0]
                                .type !=
                            1,
                  )
                ],
              ),
              SizedBox(
                height: height(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.normalText('${data[index].profitRate ?? 0}%',
                          fontWeight: FontWeight.bold,

                          fontSize: 28, color: Color(0xffFEA665)),
                      SizedBox(
                        height: height(20),
                      ),
                      Utils.normalText('收益率', fontSize: 24),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Utils.normalText('${data[index].profit ?? 0}%',
                          fontWeight: FontWeight.bold,

                          fontSize: 28, color: Color(0xffFEA665)),
                      SizedBox(
                        height: height(20),
                      ),
                      Utils.normalText('总收益(USDT)', fontSize: 24),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Utils.normalText('${data[index].count ?? 0}',
                          fontWeight: FontWeight.bold,

                          fontSize: 28, color: Color(0xffFEA665)),
                      SizedBox(
                        height: height(20),
                      ),
                      Utils.normalText('跟随人数', fontSize: 24),
                    ],
                  )),
                ],
              )
            ],
          ),
        ),
        onTap: () {
          RouterUtil.pushResult(
              context,
              "${StrategyRouter.strategyOrderDetail}?apiId=${data[index].id}",
              (result) {});
        });
  }

  ///*导航栏*/
  AppBar homeAppBarWidget() {
    return AppBar(
      elevation: 0.2,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Container(
        width: width(406),
        margin: EdgeInsets.only(left: width(20)),
        padding:
            EdgeInsets.symmetric(vertical: width(4), horizontal: height(4)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(width(4))),
            color: kTextColor4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width(196),
                height: height(64),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width(4))),
                    boxShadow: assetsType == strategyType.Strategy
                        ? kDefaultShadow
                        : null,
                    color: assetsType == strategyType.Strategy
                        ? kWhite
                        : kTransprant),
                child: GestureDetector(
                  onTap: _aActiveChanged,
                  child: Text("策略跟单",
                      style: TextStyle(
                        color: assetsType == strategyType.Strategy
                            ? kPrimaryColor
                            : kTextColor3,
                        fontSize: 15,
                      )),
                )),
            Container(
                width: width(196),
                height: height(58),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width(4))),
                    boxShadow: assetsType == strategyType.Account
                        ? kDefaultShadow
                        : null,
                    color: assetsType == strategyType.Account
                        ? kWhite
                        : kTransprant),
                child: GestureDetector(
                  onTap: _aActiveChanged1,
                  child: Text("我的账户",
                      style: TextStyle(
                        color: assetsType == strategyType.Account
                            ? kPrimaryColor
                            : kTextColor3,
                        fontSize: 15,
                      )),
                ))
          ],
        ),
      ),
      actions: <Widget>[
        Visibility(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width(50),
                height: height(64),
                margin: EdgeInsets.only(right: width(20)),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Image.asset("images/strategy/strategy_add.png"),
                  onTap: () {
                    RouterUtil.pushResult(context,
                        "${StrategyRouter.addBindAccounts}?type=${2}&editorId=${""}",
                        (result) {
                      RouterUtil.goBack(context);
                    });
                  },
                ),
              ),
            ],
          ),
          visible: assetsType == strategyType.Account &&
              Provider.of<StrategyProvider>(context, listen: false)
                      .strategyAccount !=
                  null &&
              Provider.of<StrategyProvider>(context, listen: false)
                      .strategyAccount
                      .length >
                  0 &&
              Provider.of<StrategyProvider>(context, listen: false)
                      .strategyAccount[0]
                      .type !=
                  1,
        )
      ],
    );
  }
}

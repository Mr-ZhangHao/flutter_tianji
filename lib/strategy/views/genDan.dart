import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/button/index.dart';
import 'package:flutter_tianji/common/button/index2.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/event/accountEvent.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/input/text_input2.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class genDanPage extends StatefulWidget {
  final String type; //1 跟单 2修改跟单
  final String followApiId;
  final String platformID;
  genDanPage({Key key, this.type, this.followApiId, this.platformID})
      : super(key: key);
  @override
  _genDanPageState createState() => _genDanPageState();
}

class _genDanPageState extends State<genDanPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = [];
  List<Widget> tabView = [];

  String accountId = '';
  String accountName = '';
  String memo = '';
  String avatar = '';
  List<Map<String, dynamic>> accountTypeList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<StrategyProvider>(context, listen: false)
          .getStrategyDetail(widget.followApiId);

    });
    List<String> coinList =
        Provider.of<StrategyProvider>(context, listen: false) .coinList;
    for (var i = 0; i < coinList.length; i++) {
      Provider.of<StrategyProvider>(context, listen: false)
          .getFollowInfo(widget.followApiId,Provider.of<StrategyProvider>(context, listen: false).userApiId, widget.platformID, coinList[0]);
      _tabs.add(coinList[i]);
    }

    _tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 0);

    if (Provider.of<StrategyProvider>(context, listen: false).noFollowList !=
        null &&
        Provider.of<StrategyProvider>(context, listen: false)
            .noFollowList
            .length >
            0) {
      for (int i = 0;
      i <
          Provider.of<StrategyProvider>(context, listen: false)
              .noFollowList
              .length;
      i++) {
        Map<String, dynamic> map = {
          "id": Provider.of<StrategyProvider>(context, listen: false)
              .noFollowList[i]
              .id,
          "username": Provider.of<StrategyProvider>(context, listen: false)
              .noFollowList[i]
              .username
              .toString(),
          "avatar": Provider.of<StrategyProvider>(context, listen: false)
              .noFollowList[i]
              .avatar
              .toString(),
          "memo": Provider.of<StrategyProvider>(context, listen: false)
              .noFollowList[i]
              .memo
              .toString(),
        };

        accountTypeList.add(map);
      }

      setState(() {
        this.accountName = Provider.of<StrategyProvider>(context, listen: false)
            .noFollowList[0]
            .username;
        this.avatar = Provider.of<StrategyProvider>(context, listen: false)
            .noFollowList[0]
            .avatar;
        this.memo = Provider.of<StrategyProvider>(context, listen: false)
            .noFollowList[0]
            .memo
            .toString();

        Application.eventBus.fire(accountEvent(
          Provider.of<StrategyProvider>(context, listen: false).userApiId,
          widget.followApiId,
        ));
      });
    }

  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getCommonAppBar(
        context,
        "跟单",
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Consumer<StrategyProvider>(builder:
          (BuildContext context, StrategyProvider model, Widget child) {
        return model.mStrategyDetailModel == null
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                margin: EdgeInsets.symmetric(horizontal: width(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: height(88),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Utils.normalText('跟随账户'),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xffD1D1D1),
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        return showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return AccountTypeWidget(
                              typeList: accountTypeList,
                              onTab: (id, name, avatar, memo) {
                                setState(() {
                                  this.accountId = id.toString();
                                  this.avatar = avatar;
                                  this.accountName = name;
                                  this.memo = memo;
                                  model.userApiId = id.toString();
                                  Application.eventBus.fire(accountEvent(
                                      model.userApiId.toString(),
                                      widget.followApiId,
                               ));
                                });
                                RouterUtil.goBack(context);
                              },
                            );
                          },
                        );
                      },
                    ),
                    Utils.normalText('${memo ?? ""}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Utils.normalText('跟随者',color: Color(0xff999999)),
                        avatar == null || avatar == 'null' || avatar.isEmpty
                            ? Image.asset('images/home/avatar.png',
                                width: 40, height: 40)
                            : ClipOval(
                                child: Image.network('${avatar}',
                                    fit: BoxFit.cover, width: 40, height: 40)),
                      ],
                    ),
                    SizedBox(
                      height: height(30),
                    ),
                    Divider(
                      color: Color(0xffD6D6D6),
                      height: 0.5,
                    ),
                    SizedBox(
                      height: height(30),
                    ),
                    Utils.normalText('交易员', fontWeight: FontWeight.bold),
                    SizedBox(
                      height: height(30),
                    ),
                    Row(
                      children: [
                        model.mStrategyDetailModel.avatar == null ||
                                model.mStrategyDetailModel.avatar.isEmpty
                            ? Image.asset('images/home/avatar.png',
                                width: 40, height: 40)
                            : ClipOval(
                                child: Image.network(
                                    '${model.mStrategyDetailModel.avatar}',
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40)),
                        SizedBox(
                          width: width(24),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Utils.normalText(
                                '${model.mStrategyDetailModel.username ?? ""}'),
                            SizedBox(
                              height: height(20),
                            ),
                            Utils.normalText(
                                '${model.mStrategyDetailModel.platform ?? ""}',
                                color: Color(0xff999999)),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: height(80),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                      ),
                      child: TabBar(
                        isScrollable: true,
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: Color(0xff323232),
                        labelStyle: TextStyle(
                          fontSize: sp(32),
                          fontWeight: FontWeight.normal
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor:
                            Theme.of(context).tabBarTheme.labelColor,
                        controller: _tabController,
                        tabs: _buildTabs(),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                          minHeight: height(800),
                          minWidth: double.infinity,
                          maxHeight: height(800)),
                      child: _tabBarView(model.mStrategyDetailModel.platform_id,
                          this.accountId),
                    ),
                  ],
                ),
              ));
      }),
    );
  }

  Widget _tabBarView(platform_id, accountId) {
    return TabBarView(
      controller: _tabController,
      children: _ProportionPageList(
          _tabs, widget.type, platform_id, widget.followApiId),
    );
  }

  List<Widget> _ProportionPageList(
      List<String> tabs, String type, platform_id, followApiId) {
    if (tabView.length == 0) {
      for (int i = 0; i < tabs.length; i++) {
        tabView.add(setProportionPage(
          coin: tabs[i],
          types: type,
          platform_id: platform_id,
          followApiId: followApiId,
        ));
      }
    }
    return tabView;
  }

  List<Widget> _buildTabs() {
    return _tabs
        .asMap()
        .keys
        .map((i) => Container(
            alignment: Alignment.center,
            child: Text(
              _tabs[i],
              textAlign: TextAlign.center,
            )))
        .toList();
  }
}

class setProportionPage extends StatefulWidget {
  final String coin;
  final String types;
  String followApiId;

  final int platform_id;

  setProportionPage(
      {Key key, this.coin, this.types, this.platform_id, this.followApiId})
      : super(key: key);
  @override
  _setProportionPageState createState() => _setProportionPageState();
}

class _setProportionPageState extends State<setProportionPage> {
  final _proportionCtr = TextEditingController();
  final FocusNode _proportionFocus = FocusNode();
  String accountId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听事件总线上数据变化
    Provider.of<StrategyProvider>(context, listen: false)
        .getFollowInfo(widget.followApiId,Provider.of<StrategyProvider>(context, listen: false).userApiId, widget.platform_id, widget.coin);
    Application.eventBus.on<accountEvent>().listen((event) {
      if (mounted) {
        accountId = event.accountId;
        setState(() {
          Provider.of<StrategyProvider>(context, listen: false)
              .getFollowInfo(widget.followApiId,Provider.of<StrategyProvider>(context, listen: false).userApiId, widget.platform_id, widget.coin);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Consumer<StrategyProvider>(
        builder: (BuildContext context, StrategyProvider model, Widget child) {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height(30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils.normalText('跟随${widget.coin}合约'),
              Utils.normalText('正向',color: Color(0xff999999)),
            ],
          ),
          FocusWidget(
            focusNode: _proportionFocus,
            child: InputWidget(
              focusNode: _proportionFocus,
              controller: _proportionCtr,
              maxHeight: 100,
              obscureText: false,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9.]")),//只允许输入小数
              ],
              keyboardType: TextInputType.number,
              //  inputFormatters: [_UsNumberTextInputFormatter()],
              hintText: model.proportion.isNotEmpty &&
                      double.parse(model.proportion) > 0
                  ? "${model.proportion.toString()}"
                  : '请输入跟随比例',
              contentPadding: EdgeInsets.only(bottom: height(12)),
              hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
            ),
          ),
          Utils.normalText('假如你设置为0.5倍比例跟随，交易员下单10张，那么您的下单张数为10*0.5=5张',
              color: Color(0xffB3B3B3), fontSize: 24),
          SizedBox(
            height: height(80),
          ),
          Visibility(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyButton2(
                    text: '绑定',
                    onPressed: () {
                      _gendan(widget.followApiId, model.userApiId,
                          _proportionCtr.text, widget.coin);
                    }),
                SizedBox(
                  height: height(35),
                ),
                Utils.normalText('官方提示', fontWeight: FontWeight.bold),
                SizedBox(
                  height: height(35),
                ),
                Utils.normalText(

                    '策略商城提供大v交易员的跟单，请您确认在跟随前已充分理解‘买卖自负’的市场原则，充分认识到策略交易潜在的交易风险，自行承担交易结果。\n\n任何策略都不能保证其在未来的正盈利性，过往数据不预示未来表现，相关数据仅提供参考，不构成投资建议。任何由于跟随的策略带来资金缩水或损失风险，天玑AI不担负任何责任，请您谨慎选择，合理投资。',
                color: Color(0xff999999)),
              ],
            ),
            visible: model.status == 0,
          ),
          Visibility(
            child: Column(
              children: [
                MyButton2(
                    text: '修改跟随',
                    onPressed: () {
                      _Modifygendan(widget.followApiId, model.userApiId,
                          _proportionCtr.text, widget.coin);
                    }),
                SizedBox(height: height(40)),
                MyButton2(
                    text: '取消跟随',
                    bgColor: Color(0xffE3E2EB),
                    onPressed: () {
                      _Cncelgendan(widget.followApiId, model.userApiId);
                    }),
              ],
            ),
            visible: model.status == 1,
          )
        ],
      ));
    }));
  }

  _Modifygendan(followApiId, apiId, proportion, coin) async {
    Toast.showLoading('loading...');
    await StrategyServer.getfollow(followApiId, apiId, proportion, coin)
        .then((value) => Toast.showText("修改跟随成功"));
    _proportionCtr.text = "";
    Provider.of<StrategyProvider>(context, listen: false)
        .getFollowInfo(followApiId,apiId, widget.platform_id, widget.coin);
  }

  _gendan(followApiId, apiId, proportion, coin) async {
    Toast.showLoading('loading...');
    await StrategyServer.getfollow(followApiId, apiId, proportion, coin)
        .then((value) => Toast.showText("跟随成功"));
    _proportionCtr.text = "";
    Provider.of<StrategyProvider>(context, listen: false)
        .getFollowInfo(followApiId,apiId, widget.platform_id, widget.coin);
  }

  _Cncelgendan(followApiId, apiId) async {
    Toast.showLoading('loading...');
    await StrategyServer.getCncelFollow(apiId, followApiId)
        .then((value) => Toast.showText("取消成功"));
    Provider.of<StrategyProvider>(context, listen: false)
        .getFollowInfo(followApiId,apiId, widget.platform_id, widget.coin);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

// 项目百科
enum AccountType {
  //跟随者
  follower,
  // 交易员
  traders
}

class bindingAccount extends StatefulWidget {
  @override
  _bindingAccountState createState() => _bindingAccountState();
}

class _bindingAccountState extends State<bindingAccount> {
  AccountType accountType = AccountType.follower;

  void _aActiveChanged() {
    setState(() {
      accountType = AccountType.follower;
    });
  }

  void _aActiveChanged1() {
    setState(() {
      accountType = AccountType.traders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.getCommonAppBar(
          context,
          "绑定账户",
          elevation: 1.0,
        ),
        body: Container(
          color: Color(0xffFFFFFF),
          padding:
              EdgeInsets.symmetric(horizontal: width(30), vertical: width(30)),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: _aActiveChanged,
                      child: Container(
                        decoration: BoxDecoration(
                            color: accountType == AccountType.follower
                                ? Color(0xff327865FE)
                                : Color(0xff32B1B1B1),
                            borderRadius: BorderRadius.all(Radius.circular(48)),
                            border: Border.all(
                                width: 1,
                                color: accountType == AccountType.follower
                                    ? Color(0xff7865FE)
                                    : Color(0xffD9D9D9))),
                        height: height(60),
                        width: width(140),
                        child: Center(
                          child: Utils.normalText('跟随者',
                              color: accountType == AccountType.follower
                                  ? Color(0xff7865FE)
                                  : Color(0xff666666)),
                        ),
                      )),
                  SizedBox(
                    width: width(20),
                  ),
                  GestureDetector(
                      onTap: _aActiveChanged1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: accountType == AccountType.traders
                                ? Color(0xff327865FE)
                                : Color(0xff32B1B1B1),
                            borderRadius: BorderRadius.all(Radius.circular(48)),
                            border: Border.all(
                                width: 1,
                                color: accountType == AccountType.traders
                                    ? Color(0xff7865FE)
                                    : Color(0xffD9D9D9))),
                        height: height(60),
                        width: width(140),
                        child: Center(
                          child: Utils.normalText('交易员',
                              color: accountType == AccountType.traders
                                  ? Color(0xff7865FE)
                                  : Color(0xff666666)),
                        ),
                      ))
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: height(20)),
                  padding: EdgeInsets.symmetric(
                      vertical: height(40), horizontal: width(40)),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: accountType == AccountType.follower
                            ? AssetImage("images/strategy/follow_bg.png")
                            : AssetImage("images/strategy/trade_bg.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height(480),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: height(40), horizontal: width(40)),
                        decoration: BoxDecoration(
                            color: Color(0xff502973FF),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Utils.normalText(
                            accountType == AccountType.follower
                                ? '成为天玑AI中大V的跟随者， 跟随全球优秀的加密货币交易员，复制他们的交易策略，并有着多种跟随方式选择。'
                                : '成为天玑AI的交易员，您将进入交易员排行榜，展示您的交易策略及交易记录。\n\n用户跟随您，您将获得奖励，您的交易盈利越多，所吸引的跟随者用户越多!',
                            color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: height(100),
                      ),
                      InkWell(
                        child: Container(
                          width: width(360),
                          height: height(88),
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            color: Color(0xFFFFFFFF), // 底色
                            borderRadius:
                                new BorderRadius.circular(width(48)), // 圆角度
                          ),
                          child: Center(
                            child: Text("+立即绑定",
                                style: TextStyle(
                                    fontSize: sp(28),
                                    color: Color(0xff7865FE))),
                          ),
                        ),
                        onTap: () {
                          RouterUtil.pushResult(context,
                              "${StrategyRouter.addBindAccounts}?type=${accountType == AccountType.traders ? 1 : 2}&editorId=${""}",
                              (result) {
                            RouterUtil.goBack(context);
                          });
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/business/views/screenRightDrawer.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/routes/index.dart';
import 'package:flutter_tianji/strategy/views/AllStrategyListView.dart';
import 'package:flutter_tianji/strategy/views/StrategyRightDrawer.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 
全部策略
 */
class AllStrategy extends StatefulWidget {
  @override
  _AllStrategyState createState() => _AllStrategyState();
}

class _AllStrategyState extends State<AllStrategy>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;

  List tabbarList = ['USDT合约', '币本合约', '币币现货'];
  String coinID = '';
  String mPlatform = '';
  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: tabbarList.length);
    _tabController.addListener(() => _onTabChanged());
  }

  _onTabChanged() {
    if (_tabController.indexIsChanging) {
      if (this.mounted) {
        this.setState(() => currentIndex = _tabController.index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getCommonAppBar(context, "全部策略", elevation: 1.0, actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width(50),
              height: height(64),
              margin: EdgeInsets.only(right: width(20)),
              alignment: Alignment.center,
              child: GestureDetector(
                child: Image.asset("images/baike/shoucang@2x.png"),
                onTap: () {
                  RouterUtil.push(context, StrategyRouter.myInterests);
                },
              ),
            ),
          ],
        )
      ]),
      body: Column(
        children: [
          Container(
            height: height(88),
            width: double.infinity,
            child: AppBarWidget(),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                padding: EdgeInsets.only(right: width(20), left: width(20)),
                margin: EdgeInsets.all(width(20)),
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: AllStrategyListView(
                  index: 1,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width(20), left: width(20)),
                margin: EdgeInsets.all(width(20)),
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: AllStrategyListView(
                  index: 2,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width(20), left: width(20)),
                margin: EdgeInsets.all(width(20)),
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: AllStrategyListView(
                  index: 3,
                ),
              ),
            ],
          ))
        ],
      ),
      endDrawer: StrategyRightDrawer(
        coinID: coinID,
        mPlatformId: mPlatform,
        onTab: (e) async {},
        onCoinTab: (coin) {
          setState(() {
            this.coinID = coin;
          });
        },
        onPlatformTab: (Platform) {
          setState(() {
            this.mPlatform = Platform;
          });
        },
      ),
    );
  }

  AppBar AppBarWidget() {
    return AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          width: double.infinity,
          height: height(80),
          margin: EdgeInsets.only(left: width(20)),
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: false,
            labelPadding: EdgeInsets.only(left: width(40), right: width(40)),
            labelColor: Color(0xff7865FE),
            unselectedLabelColor: Color(0xff323232),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Theme.of(context).tabBarTheme.labelColor,
            controller: _tabController,
            tabs: tabbarList
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      e,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: sp(28),
                      ),
                    ),
                  ),
                )
                .toList(),
            onTap: (int index) {
              _tabController.index = index;
              setState(() {});
            },
          ),
        ),
        actions: <Widget>[
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(20)),
                  child: Image.asset('images/business/icon_screen.png',
                      width: width(48), height: height(48))),
            );
          }),
        ]);
  }
}

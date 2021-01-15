import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/view/detail/liquidity.dart';
import 'package:flutter_tianji/baike/view/detail/marketHeat.dart';
import 'package:flutter_tianji/baike/view/detail/projectEvaluation.dart';
import 'package:flutter_tianji/baike/view/detail/riskAssessment.dart';
import 'package:flutter_tianji/baike/view/detail/valueEvaluation.dart';
import 'package:flutter_tianji/business/views/item/tradeStatisticList.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';

class projectDetilPage extends StatefulWidget {
  @override
  _projectDetilPageState createState() => _projectDetilPageState();
}

class _projectDetilPageState extends State<projectDetilPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['项目测评', '风险测评', '价值评级', '市场热度', '流动性'];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('评测详情'),
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => RouterUtil.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png',
                  width: width(22), height: height(36)),
            )),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height(80),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: TabBar(
              isScrollable: false,
              labelPadding: EdgeInsets.only(left: width(20), right: width(20)),
              labelColor: Color(0xff7865FE),
              unselectedLabelColor: Color(0xff323232),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).tabBarTheme.labelColor,
              controller: _tabController,
              tabs: _buildTabs(),
            ),
          ),
          Container(
            width: double.infinity,
            height: height(20),
            color: Color(0xffF9F8FA),
          ),
          Expanded(
            child: Container(
              color: kWhite,
              child: _tabBarView(),
            ),
          )
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        projectEvaluationPage(),
        riskAssessmentPage(),
        valueEvaluation(),
        marketHeatPage(),
        liquidityPage()
      ],
    );
  }

  List<Widget> _buildTabs() {
    return _tabs
        .asMap()
        .keys
        .map((i) => Container(
            alignment: Alignment.center,
            child: Text(
              _tabs[i],
              style: TextStyle(fontSize: sp(22)),
              textAlign: TextAlign.center,
            )))
        .toList();
  }
}

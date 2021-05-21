import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
import 'package:flutter_tianji/baike/server/index.dart';
import 'package:flutter_tianji/baike/view/detail/liquidity.dart';
import 'package:flutter_tianji/baike/view/detail/marketHeat.dart';
import 'package:flutter_tianji/baike/view/detail/projectEvaluation.dart';
import 'package:flutter_tianji/baike/view/detail/riskAssessment.dart';
import 'package:flutter_tianji/baike/view/detail/valueEvaluation.dart';
import 'package:flutter_tianji/business/views/item/tradeStatisticList.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:provider/provider.dart';

class projectDetilPage extends StatefulWidget {
  final String id;
  projectDetilPage({Key key,this.id}) : super(key: key);
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
    Provider.of<baikeProvider>(context, listen: false).getprojectDetail(widget.id);
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
        elevation: 0.5,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => RouterUtil.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png',
                  width: width(22), height: height(36)),
            )),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width(40),
                height: height(40),
                margin: EdgeInsets.only(right: width(20)),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Image.asset("images/baike/shoucang@2x.png"),
                  onTap: () {
                    _follow(widget.id);
                  },
                ),
              ),
            ],
          )
        ],
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
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: width(20), right: width(20)),
              labelColor: kPrimaryColor,
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
              style: TextStyle(fontSize: sp(28)),
              textAlign: TextAlign.center,
            )))
        .toList();
  }
  _follow(id) async {
    Toast.showLoading('loading...');
    await baikeServer.collect(id);
    Toast.showText("收藏成功");
  }
}

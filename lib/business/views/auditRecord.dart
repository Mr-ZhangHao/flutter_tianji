import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/views/auditRecordList.dart';
import 'package:flutter_tianji/business/views/record_ListView.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 审核记录 */
class auditRecordPage extends StatefulWidget {
  @override
  _auditRecordPageState createState() => _auditRecordPageState();
}

class _auditRecordPageState extends State<auditRecordPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['待审核', '已确认', '已取消'];

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
      appBar: Utils.getCommonAppBar(
        context,
        "审核记录",
        elevation: 0.5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: height(80),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: TabBar(
              isScrollable: false,
              labelPadding: EdgeInsets.only(left: width(40), right: width(40)),
              labelColor: Color(0xff7865FE),
              unselectedLabelColor: Color(0xff323232),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).tabBarTheme.labelColor,
              controller: _tabController,
              tabs: _buildTabs(),
            ),
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
        auditRecordListPage(),
        auditRecordListPage(),
        auditRecordListPage()
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
              style: TextStyle(fontSize: sp(26)),
              textAlign: TextAlign.center,
            )))
        .toList();
  }
}

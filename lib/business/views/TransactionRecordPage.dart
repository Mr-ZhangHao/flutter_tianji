import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/views/record_ListView.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 交易记录 */
class TransactionRecord extends StatefulWidget {
  TransactionRecord({Key key}) : super(key: key);

  @override
  _TransactionRecordState createState() => _TransactionRecordState();
}

class _TransactionRecordState extends State<TransactionRecord>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['全部', '转入', '转出'];

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
      appBar: Utils.getCommonAppBar(context, "交易记录", elevation: 0.5, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "全部交易记录",
              style: TextStyle(color: kPrimaryColor),
            ),
            SizedBox(
              width: width(30),
            ),
          ],
        )
      ]),
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
        TransactionRecordListView(),
        TransactionRecordListView(),
        TransactionRecordListView()
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
              textAlign: TextAlign.center,
            )))
        .toList();
  }
}

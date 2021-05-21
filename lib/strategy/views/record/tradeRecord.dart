import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/strategy/views/record/ongoingListView.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/*  
用户账户记录
 */
class tradeRecordPage extends StatefulWidget {
  final String apiId;
  final String type;
  tradeRecordPage({Key key, this.apiId, this.type}) : super(key: key);
  @override
  _tradeRecordPageState createState() => _tradeRecordPageState();
}

class _tradeRecordPageState extends State<tradeRecordPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['正在持仓', '历史记录'];

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
      appBar: Utils.getCommonAppBar(context, "交易记录", elevation: 0.5),
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
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: width(40), right: width(40)),
              labelColor: kPrimaryColor,
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
        ongoingListView(
          index: 6,
          apiId: widget.apiId,
          type: 1,
        ),
        ongoingListView(
          index: 7,
          apiId: widget.apiId,
          type: 1,
        ),
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

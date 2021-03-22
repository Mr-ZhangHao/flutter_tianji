import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/strategy/views/gensui/genSuiListView.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/* 
    跟随记录 
 */
class genSuiRecordPage extends StatefulWidget {
  final String id;
  final String type;
  genSuiRecordPage({Key key, this.id, this.type}) : super(key: key);

  @override
  _genSuiRecordPageState createState() => _genSuiRecordPageState();
}

class _genSuiRecordPageState extends State<genSuiRecordPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['正在跟随', '历史跟随'];

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
          context, widget.type == '1' ? "跟随者" : "跟随交易员",
          elevation: 0.5),
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
          SizedBox(
            height: height(20),
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
        genSuiListView(
          index: 1,
          id: widget.id,
          type: int.parse(widget.type),
        ),
        genSuiListView(
          index: 2,
          id: widget.id,
          type: int.parse(widget.type),
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

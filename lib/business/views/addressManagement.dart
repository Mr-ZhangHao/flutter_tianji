import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/views/addressManagementList.dart';
import 'package:flutter_tianji/business/views/screenRightDrawer.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/tabbar/indicator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class addressManagementPage extends StatefulWidget {
  @override
  _addressManagementPageState createState() => _addressManagementPageState();
}

class _addressManagementPageState extends State<addressManagementPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;
  List<Widget> tabView = [
    addressManagementListView(),
    addressManagementListView(),
    addressManagementListView(),
    addressManagementListView(),
  ];
  List tabbarList = ['btc', 'eth', 'eth', 'eth'];

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
      appBar: Utils.getCommonAppBar(context, "地址管理", elevation: 1.0, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "归集任务",
              style: TextStyle(color: kPrimaryColor),
            ),
            SizedBox(
              width: width(30),
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
              addressManagementListView(),
              addressManagementListView(),
              addressManagementListView(),
              addressManagementListView()
            ],
          ))
        ],
      ),
      endDrawer: screenRightDrawer(
        onTab: (e) async {},
      ),
    );
  }

/*    List<Widget> _C2cList(List<C2cCoinsModel> model) {
    if (tabView.length == 0) {
      for (int i = 0; i < model.length; i++) {
        tabView.add(C2cListPage(0, model[i].id,model[i].name, model[i].name, currencyModel,
            currencyID, PaymentID));
      }
    }
    return tabView;
  } */
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

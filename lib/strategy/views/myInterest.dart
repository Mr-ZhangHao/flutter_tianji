import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/model/myInterestListModel.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

/* 
我的关注
 */
class myInterest extends StatefulWidget {
  @override
  _myInterestState createState() => _myInterestState();
}

class _myInterestState extends State<myInterest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: Utils.getCommonAppBar(
        context,
        "我的关注",
        elevation: 0.5,
      ),
      body: myInterestListView(),
    );
  }
}

class myInterestListView extends PageList {
  myInterestListView({Key key}) : super(key: key);
  @override
  _myInterestListViewState createState() => _myInterestListViewState();
}

class _myInterestListViewState
    extends PageListState<myInterestListModel, myInterestListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
    );
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<myInterestListModel>) onSuccess,
      Function onErr}) async {
    try {
      var data = await StrategyServer.getInterestList();

      // var data = [myInterestListModel(), myInterestListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(myInterestListModel model) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width(30)),
          // 下边框
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xffEAEAEA)))),
          height: height(150),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              model.avatar != null
                  ? ClipOval(
                      child: Image.network('${model.avatar}',
                          fit: BoxFit.cover, width: 40, height: 40))
                  : Image.asset('images/home/avatar.png',
                      width: 40, height: 40),
              SizedBox(
                width: width(20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Utils.normalText('${model.username ?? ""}',
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: height(10),
                  ),
                  Utils.normalText('${model.platform}/${model.coin}',
                      fontSize: 24, color: Color(0xff999999)),
                ],
              ),
              Expanded(child: Text('')),
              GestureDetector(
                child: Container(
                  width: width(160),
                  height: height(70),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(44)),
                  ),
                  child: Text('取消关注',
                      style: TextStyle(fontSize: sp(24), color: Colors.white)),
                ),
                onTap: () {
                  _unfollow(model.id);
                },
              )
            ],
          ),
        ),
        onTap: () {});
  }

  _unfollow(id) async {
    Toast.showLoading('loading...');
    await StrategyServer.getCancelInterest(id);
    Toast.showText("取消关注成功");
    loadData(1);
  }

  @override
  empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/business/no_task.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text('${Tr.of(context).homeNodata}',
              style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }
}

/* 交易统计 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/model/addressManagementModel.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class addressManagementListView extends PageList {
  addressManagementListView({Key key}) : super(key: key);

  @override
  _addressManagementListViewState createState() =>
      _addressManagementListViewState();
}

class _addressManagementListViewState
    extends PageListState<addressManagementModel, addressManagementListView> {
  bool flag = false;
  bool flag2 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            color: Colors.white,
            height: height(160),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Utils.normalText('总额:0.000000001 ',
                    fontSize: 32, fontWeight: FontWeight.bold),
                Utils.normalText('地址总量:100'),
              ],
            ),
          ),
          SizedBox(
            height: height(20),
          ),
          Expanded(child: buildList(context)),
          Container(
            height: height(98),
            color: Color(0xff7865FE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Utils.normalText('一键归集',
                        color: Colors.white, textAlign: TextAlign.center),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: width(1),
                  height: height(48),
                  color: Colors.white,
                ),
                Expanded(
                    child: GestureDetector(
                  child: Utils.normalText('新建归集任务',
                      color: Colors.white, textAlign: TextAlign.center),
                  onTap: () {},
                )),
              ],
            ),
          )
        ],
      ),
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
      Function(List<addressManagementModel>) onSuccess,
      Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      var data = [addressManagementModel(), addressManagementModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(addressManagementModel model) {
    TextStyle styleSm = TextStyle(fontSize: sp(28), color: Color(0xff323232));
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.white,
      padding:
          EdgeInsets.only(left: width(40), right: width(40), top: height(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Utils.normalText('地址：0x7a912sdhlsd…2adsfhlzl28fa'),
              SizedBox(
                width: width(20),
              ),
              Image.asset('images/business/icon_copy.png',
                  width: width(44), height: height(44)),
            ],
          ),
          SizedBox(
            height: height(20),
          ),
          Utils.normalText('创建时间:2020-10-27  12:10:36'),
          SizedBox(
            height: height(20),
          ),
          Utils.normalText('可用余额:0.000000001 BTC'),
          SizedBox(
            height: height(20),
          ),
          Row(
            children: [
              Utils.normalText('归集状态：'),
              CupertinoSwitch(
                value: this.flag,
                activeColor: Color(0xff7865FE),
                onChanged: (bool value) {
                  setState(() {
                    this.flag = value;
                  });
                },
              )
            ],
          ),
          SizedBox(
            height: height(20),
          ),
          Row(
            children: [
              Utils.normalText('状态：'),
              CupertinoSwitch(
                activeColor: Color(0xff7865FE),
                value: this.flag2,
                onChanged: (bool value) {
                  setState(() {
                    this.flag2 = value;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  empty() {
    return SizedBox();
  }
}

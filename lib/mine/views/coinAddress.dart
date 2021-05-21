import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/mine/model/coinAddress_model.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class coinAddressPage extends StatefulWidget {
  @override
  _coinAddressPageState createState() => _coinAddressPageState();
}

class _coinAddressPageState extends State<coinAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          Utils.getCommonAppBar(context, "我的交易地址", elevation: 0.5, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Icon(
                Icons.add,
                color: kPrimaryColor,
                size: 20,
              ),
              onTap: () {
                //     RouterUtil.push(context, BusinessRouter.taskAllocation);
              },
            ),
            SizedBox(
              width: width(30),
            ),
          ],
        ),
      ]),
      body: coinAddressListView(),
    );
  }
}

/**
* 交易记录
* */
class coinAddressListView extends PageList {
  coinAddressListView({Key key}) : super(key: key);

  @override
  _coinAddressListViewState createState() => _coinAddressListViewState();
}

class _coinAddressListViewState
    extends PageListState<coinAddress_model, coinAddressListView> {
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
      Function(List<coinAddress_model>) onSuccess,
      Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      var data = [coinAddress_model(), coinAddress_model()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(coinAddress_model model) {
    return Container(
      constraints: BoxConstraints(minHeight: height(100)),
      child: Row(
        children: [
          Utils.normalText('dadadasdasd'),
          Utils.normalText('火币'),
          Utils.normalText('BTH'),
          Expanded(
            child: Image.asset(
              'images/mine/next.png',
              width: width(18),
              color: Color(0xff323232),
            ),
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

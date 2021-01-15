/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-13 11:31:05
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 17:23:05
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/marked_list.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/home/model/transfer_model.dart';
import 'package:flutter_tianji/home/widgets/home_widget/market_list_item.dart';

class MarketListView extends PageList {
  MarketListView({Key key}) : super(key: key);
  @override
  _MarketListViewState createState() => _MarketListViewState();
}

class _MarketListViewState
    extends PageListState<TransferModel, MarketListView> {
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
      Function(List<TransferModel>) onSuccess,
      Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      var data = [TransferModel(), TransferModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(TransferModel model) {
    return MarketListItem(
      symbol: 'BTC/USDT',
      amount: 75.16,
      price: 256.32,
      volum: 87.13,
      rate: -9.0,
    );
  }

  @override
  empty() {
    return SizedBox();
  }
}

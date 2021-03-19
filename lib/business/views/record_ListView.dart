import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/views/item/record_List_item.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/home/model/transfer_model.dart';

/**
* 交易记录
* */
class TransactionRecordListView extends PageList {
  TransactionRecordListView({Key key}) : super(key: key);

  @override
  _TransactionRecordListViewState createState() =>
      _TransactionRecordListViewState();
}

class _TransactionRecordListViewState
    extends PageListState<TransferModel, TransactionRecordListView> {
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
    return TransactionRecordListItem(
      type: '转入',
      Currency: 'BTC',
      Creationtime: "2020-10-27 12:10:36",
      amount: 0.00001,
      address: '0x7a912sdhlsd…2adsfhlzl28fa',
    );
  }

  @override
  empty() {
    return SizedBox();
  }
}

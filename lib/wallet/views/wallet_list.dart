import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/home/model/transfer_model.dart';
import 'package:flutter_tianji/home/widgets/home_widget/marked_list.dart';
import 'package:flutter_tianji/wallet/views/wallet_list_item.dart';

class walletListView extends PageList {
  walletListView({Key key}) : super(key: key);
  @override
  _walletListViewState createState() => _walletListViewState();
}

class _walletListViewState  extends PageListState<TransferModel, MarketListView> {
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
    return WalletListItem(
      image: '',
      amount: 75.16,
      cny: 256.32,
      Currency:'BTC',
    );
  }

  @override
  empty() {
    return SizedBox();
  }
}

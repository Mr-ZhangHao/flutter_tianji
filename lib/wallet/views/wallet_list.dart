import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/home/widgets/home_widget/marked_list.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/wallet/model/coin_info_model.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:flutter_tianji/wallet/views/wallet_list_item.dart';

class walletListView extends PageList {
  final WallerProvider wallerProvider;
  walletListView({Key key, this.wallerProvider}) : super(key: key);
  @override
  _walletListViewState createState() => _walletListViewState();
}

class _walletListViewState
    extends PageListState<CoinInfoModel, MarketListView> {
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
      Function(List<CoinInfoModel>) onSuccess,
      Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      // var data = [TransferModel(), TransferModel()];
      onSuccess((widget as walletListView).wallerProvider.coinInfoList);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(CoinInfoModel model) {
    return WalletListItem(
      image: '',
      amount: model.available.toString(),
      cny: model.cny,
      Currency: model.coin.name,
      model: (widget as walletListView).wallerProvider,
    );
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

import 'package:flutter_tianji/providers/view_state_model.dart';
import 'package:flutter_tianji/wallet/model/assets_preview_model.dart';
import 'package:flutter_tianji/wallet/model/coin_info_model.dart';
import 'package:flutter_tianji/wallet/server/index.dart';

// Routers.push(context, WalletRouter.verification)

class WithdrawField {
  String coinId;
  String chainName;
  String address;
  String number;
  String coinName;
  int tfaType;
  WithdrawField(this.coinId, this.chainName, this.address, this.number,
      this.tfaType, this.coinName);
}

class WallerProvider extends ViewStateModel {
  bool isOpen = true;
  AssetPreviewModel assetPreview;
  List<CoinInfoModel> coinInfoList = [];

  CoinInfoModel currentCoin;

  WithdrawField withdrawField = WithdrawField('', '', '', '', 0, '');

  bool isHidden = false;

  setIsHidden(bool param) {
    isHidden = param;
    notifyListeners();
  }

  setIsOpen(bool param) {
    isOpen = param;
    notifyListeners();
  }

  setCurrentCoin(coinName) {
    currentCoin =
        coinInfoList.singleWhere((item) => item.coin.name == coinName);
    notifyListeners();
  }

  void setWithdrawField(WithdrawField params) {
    withdrawField = params;
    notifyListeners();
  }

  void getBibiAsset() async {
    AssetPreviewModel data = await WalletServer.getBibiAsset();
    assetPreview = data;
    notifyListeners();
  }

  void getCoinList({coinName}) async {
    List<CoinInfoModel> data = await WalletServer.getCoinList('');
    coinInfoList = data;
    currentCoin = coinInfoList
        .singleWhere((item) => item.coin.name == (coinName ?? 'USDT'));

    notifyListeners();
  }

  void getCurrentCoin(coinName) async {
    List<CoinInfoModel> data = await WalletServer.getCoinList(coinName);
    currentCoin = data[0];
    notifyListeners();
  }
}

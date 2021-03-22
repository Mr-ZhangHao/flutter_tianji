import 'package:flutter_tianji/providers/view_state_model.dart';
import 'package:flutter_tianji/strategy/model/CoinsModel.dart';
import 'package:flutter_tianji/strategy/model/FollowInfoViewModel.dart';
import 'package:flutter_tianji/strategy/model/StrategyAccountModel.dart';
import 'package:flutter_tianji/strategy/model/StrategyDetailModel.dart';
import 'package:flutter_tianji/strategy/model/StrategyTypeModel.dart';
import 'package:flutter_tianji/strategy/model/accountDetailModel.dart';
import 'package:flutter_tianji/strategy/model/apiModel.dart';
import 'package:flutter_tianji/strategy/model/genSuiListViewModel.dart';
import 'package:flutter_tianji/strategy/model/noFollowListViewModel.dart';
import 'package:flutter_tianji/strategy/model/platformsModel.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';
import 'package:flutter_tianji/strategy/server/index.dart';

class StrategyProvider extends ViewStateModel {
  List<strategyListModel> coinInfoList1 = [];
  List<strategyListModel> coinInfoList2 = [];
  List<strategyListModel> coinInfoList3 = [];
  //账户
  List<StrategyAccountModel> strategyAccount;
  //
  List<platformsModel> platformsList; //全部平台
  List<CoinsModel> coinsList; //全部币种
  List<StrategyTypeModel> strategyTypeList;

  List<noFollowListViewModel> noFollowList; //未跟随列表

  accountDetailModel mAccountDetailModel; //账户详情
  apiModel mApiModel; //api
  genSuiListViewModel mGenSuiListViewModel; //跟随详情
  StrategyDetailModel mStrategyDetailModel; //策略详情

  FollowInfoViewModel mFollowInfoViewModel; //跟随币种信息
  int status = 0;
  String proportion = '';
  String userApiId;

  void getFollowInfo(followApiId, platform, coin) async {
    setBusy();
    try {
      var data = await StrategyServer.getFollowPro(followApiId, platform, coin);
      mFollowInfoViewModel = data;
      status = data.status;
      proportion = data.proportion.toString();
      print('status:' + status.toString());
      notifyListeners();
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getStrategyList({type, platform, coin}) async {
    List<strategyListModel> data =
        await StrategyServer.getStrategyList(type, platform, coin);
    if (type == 1) {
      coinInfoList1 = data;
    } else if (type == 2) {
      coinInfoList2 = data;
    } else if (type == 3) {
      coinInfoList3 = data;
    }
    notifyListeners();
  }

  void getStrategyAccount() async {
    setBusy();
    try {
      var data = await StrategyServer.getStrategyAccount();
      strategyAccount = data;
      notifyListeners();
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getnoFollowList(follow_api_id, platform) async {
    setBusy();
    try {
      var data = await StrategyServer.getnoFollowList(follow_api_id, platform);
      noFollowList = data;
      if (noFollowList.length > 0) {
        userApiId = data[0].id.toString();
      }

      notifyListeners();
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getApiModelDetail(id) async {
    setBusy();
    try {
      var data = await StrategyServer.getApiModelDetail(id);
      mApiModel = data;
      notifyListeners();
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getGensuiDetail(apiId, followApiId) async {
    setBusy();
    try {
      var data = await StrategyServer.getGensuiDetail(apiId, followApiId);
      mGenSuiListViewModel = data;
      notifyListeners();
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getStrategyDetail(apiId) async {
    setBusy();

    try {
      var data = await StrategyServer.getStrategyDetail(apiId);
      mStrategyDetailModel = data;
      notifyListeners();
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getAccountDetail(id) async {
    setBusy();

    try {
      var data = await StrategyServer.getAccountDetail(id);
      mAccountDetailModel = data;
      notifyListeners();
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getPlatformsList() async {
    var data = await StrategyServer.getPlatformsList();
    platformsList = data;
    notifyListeners();
  }

  void getStrategyType() async {
    var data = await StrategyServer.getStrategyType();
    strategyTypeList = data;
    notifyListeners();
  }

  void getCoinsList() async {
    var data = await StrategyServer.getCoinsList();
    coinsList = data;
    notifyListeners();
  }
}

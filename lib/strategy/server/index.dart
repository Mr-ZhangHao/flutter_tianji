import 'package:flutter_tianji/core/network/http.dart';
import 'package:flutter_tianji/strategy/model/CoinsModel.dart';
import 'package:flutter_tianji/strategy/model/FollowInfoViewModel.dart';
import 'package:flutter_tianji/strategy/model/StrategyAccountModel.dart';
import 'package:flutter_tianji/strategy/model/StrategyDetailModel.dart';
import 'package:flutter_tianji/strategy/model/StrategyTypeModel.dart';
import 'package:flutter_tianji/strategy/model/accountDetailModel.dart';
import 'package:flutter_tianji/strategy/model/apiModel.dart';
import 'package:flutter_tianji/strategy/model/genSuiListViewModel.dart';
import 'package:flutter_tianji/strategy/model/myInterestListModel.dart';
import 'package:flutter_tianji/strategy/model/noFollowListViewModel.dart';
import 'package:flutter_tianji/strategy/model/ongoingListViewModel.dart';
import 'package:flutter_tianji/strategy/model/platformsModel.dart';
import 'package:flutter_tianji/strategy/model/strategyListModel.dart';

class StrategyServer {
  static Future<List<strategyListModel>> getStrategyList(
      type, platform, coin) async {
    var res = await http.get('/api/strategy/list', queryParameters: {
      "trans_type": type,
      "platform": platform,
      "coin": coin,
    });
    return (res.data['data'] as List)
        .map((e) => strategyListModel.fromJson(e))
        .toList();
  }

//我的关注
  static Future<List<myInterestListModel>> getInterestList() async {
    var res = await http.get('/api/strategy/care_all');
    return (res.data['data'] as List)
        .map((e) => myInterestListModel.fromJson(e))
        .toList();
  }

//取消关注
  static Future getCancelInterest(id) async {
    var res = await http
        .get('/api/strategy/cancel_care', queryParameters: {"id": id});
    return res.data;
  }

//关注
  static Future getInterest(id) async {
    var res = await http.post('/api/strategy/care', data: {"api_id": id});
    return res.data;
  }

//跟随
  static Future getfollow(follow_api_id, user_api_id, proportion, coin) async {
    var res = await http.post('/api/strategy/follow', data: {
      "follow_api_id": follow_api_id,
      "user_api_id": user_api_id,
      "proportion": proportion,
      "coin": coin
    });
    return res.data;
  }

//全部交易平台
  static Future<List<platformsModel>> getPlatformsList() async {
    var res = await http.get('/api/strategy/platforms');
    return (res.data['data'] as List)
        .map((e) => platformsModel.fromJson(e))
        .toList();
  }

//全部币种
  static Future<List<CoinsModel>> getCoinsList() async {
    var res = await http.get('/api/strategy/coins');
    return (res.data['data'] as List)
        .map((e) => CoinsModel.fromJson(e))
        .toList();
  }

//全部策略跟单类型
  static Future<List<StrategyTypeModel>> getStrategyType() async {
    var res = await http.get('/api/strategy/types');
    return (res.data['data'] as List)
        .map((e) => StrategyTypeModel.fromJson(e))
        .toList();
  }

//跟单账户
  static Future<List<StrategyAccountModel>> getStrategyAccount() async {
    var res = await http.get('/api/strategy/account');
    return (res.data['data'] as List)
        .map((e) => StrategyAccountModel.fromJson(e))
        .toList();
  }

  //API录入
  static Future getCreateApi(Map data) async {
    var res = await http.post('/api/strategy/create_api', data: data);
    return res.data;
  }

  //API编辑
  static Future getUpdateApi(Map data) async {
    var res = await http.post('/api/strategy/update_api', data: data);
    return res.data;
  }

  //API修改备注
  static Future getUpdateApiMemo(id, memo) async {
    var data = {"api_id": id, "memo": memo};
    var res = await http.post('/api/strategy/update_api_memo', data: data);
    return res.data;
  }

  //API删除
  static Future getDeleteApi(id) async {
    var res = await http
        .get('/api/strategy/delete_api', queryParameters: {"api_id": id});
    return res.data;
  }

  //账户详情
  static Future<accountDetailModel> getAccountDetail(id) async {
    var res =
        await http.get('/api/strategy/index', queryParameters: {"api_id": id});
    return accountDetailModel.fromJson(res.data['data']);
  }

  //策略详情
  static Future<StrategyDetailModel> getStrategyDetail(id) async {
    var res =
        await http.get('/api/strategy/info', queryParameters: {"api_id": id});
    return StrategyDetailModel.fromJson(res.data['data']);
  }

  //API详情
  static Future<apiModel> getApiModelDetail(id) async {
    var res = await http
        .get('/api/strategy/api_info', queryParameters: {"api_id": id});
    return apiModel.fromJson(res.data['data']);
  }

  //交易记录
  static Future<List<ongoingListViewModel>> getTransactionRecord(data) async {
    var res = await http.get('/api/strategy/trans_list', queryParameters: data);
    return (res.data['data'] as List)
        .map((e) => ongoingListViewModel.fromJson(e))
        .toList();
  }

  //交易记录
  static Future<List<ongoingListViewModel>> getTransactionRecord2(data) async {
    var res = await http.get('/api/strategy/trans_list', queryParameters: data);
    return (res.data['data'] as List)
        .map((e) => ongoingListViewModel.fromJson(e))
        .toList();
  }

  //跟随者记录 交易员
  static Future<List<genSuiListViewModel>> getGensuiRecord(status, id) async {
    var res = await http.get('/api/strategy/followers',
        queryParameters: {"status": status, "api_id": id});
    return (res.data['data'] as List)
        .map((e) => genSuiListViewModel.fromJson(e))
        .toList();
  }

  //跟随员记录
  static Future<List<genSuiListViewModel>> getGensuiRecord2(status, id) async {
    var res = await http.get('/api/strategy/follower_list',
        queryParameters: {"status": status, "api_id": id});
    return (res.data['data'] as List)
        .map((e) => genSuiListViewModel.fromJson(e))
        .toList();
  }

  //未跟随账户
  static Future<List<noFollowListViewModel>> getnoFollowList(
      follow_api_id, platform) async {
    var res = await http.post('/api/strategy/no_follow_list', queryParameters: {
      "follow_api_id": follow_api_id,
      "platform": platform
    });
    return (res.data['data'] as List)
        .map((e) => noFollowListViewModel.fromJson(e))
        .toList();
  }

  //跟随详情
  static Future<genSuiListViewModel> getGensuiDetail(apiId, followApiId) async {
    var res = await http.get('/api/strategy/follower_info', queryParameters: {
      "api_id": apiId,
      "follow_api_id": followApiId,
    });
    return genSuiListViewModel.fromJson(res.data['data']);
  }

  //跟随取消
  static Future getCncelFollow(id, followApiId) async {
    var res = await http.post('/api/strategy/cancel_follow', queryParameters: {
      "api_id": id,
      "follow_api_id": followApiId,
    });
    return res.data;
  }

  //跟随信息
  static Future<FollowInfoViewModel> getFollowPro(
      followApiId, platform, coin) async {
    var res = await http.post('/api/strategy/follow_pro', queryParameters: {
      "platform": platform,
      "follow_api_id": followApiId,
      "coin": coin,
    });
    return FollowInfoViewModel.fromJson(res.data['data']);
  }
}

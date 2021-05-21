/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 20:45:41
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/wallet/routes/index.dart
*/

import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/routes/router_init.dart';
import 'package:flutter_tianji/wallet/views/item.dart';
import 'package:flutter_tianji/wallet/views/recharge.dart';
import 'package:flutter_tianji/wallet/views/record_bibi.dart';
import 'package:flutter_tianji/wallet/views/record_bibi2.dart';
import 'package:flutter_tianji/wallet/views/verification.dart';
import 'package:flutter_tianji/wallet/views/withdraw.dart';
import 'package:flutter_tianji/wallet/views/withdrawDetail.dart';

class WalletRouter implements IRouterProvider {
  static String security = '/security';
  static String item = '/item';
  static String recharge = '/recharge';
  static String withdraw = '/withdraw';
  static String withdrawDetail = '/withdrawDetail';
  static String transformation = '/transformation';
  static String contract = '/contract';
  static String recordBibi = '/recordBibi';
  static String recordBibi2 = '/recordBibi2';
  static String recordContract = '/recordContract';
  static String recordDetail = '/recordDetail';
  static String verification = '/verification';
  static String trade = '/trade';
  static String Mining = '/Mining';
  static String MiningList = '/MiningList';
  static String RuleDescription = '/RuleDescription';

  @override
  void initRouter(FluroRouter router) {
    router.define(item, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var coinName = params['coinName'].first;
      return ItemPage(coinName: coinName);
    }));
        router.define(recordBibi2, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var coinName = params['coinName'].first;
      var id = params['id'].first;
      return RecordBibiPage2(coinName: coinName,id: id,);
    }));

    router.define(recharge, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var coinName = params['coinName'].first;
      return RechargePage(coinName: coinName);
    }));


    router.define(recordBibi,
        handler: Handler(handlerFunc: (_, __) => RecordBibiPage()));

    router.define(withdraw,
        handler: Handler(handlerFunc: (_, __) => WithdrawPage()));
    router.define(withdrawDetail, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var coinName = params['coinName'].first;
      return WithdrawDetailPage(coinName: coinName);
    }));

    router.define(verification,
        handler: Handler(handlerFunc: (_, __) => VerificationPage()));

/*
    router.define(transformation, handler: Handler(handlerFunc: (_, __) => TransformationPage()));
    router.define(contract, handler: Handler(handlerFunc: (_, __) => ContractPage()));
    router.define(recordBibi, handler: Handler(handlerFunc: (_, __) => RecordBibiPage()));
    router.define(recordContract, handler: Handler(handlerFunc: (_, __) => RecordContractPage()));
    router.define(recordDetail, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      Map<String, dynamic> item = json.decode(params['param'].first);
      BibiRecored model = BibiRecored.fromJson(item);
      return RecordDetailPage(model: model);
    }));

    router.define(trade, handler: Handler(handlerFunc: (_, __) => TradeScreen()));
    router.define(MiningList, handler: Handler(handlerFunc: (_, __) => MiningListPage()));
    router.define(RuleDescription, handler: Handler(handlerFunc: (_, __) => RuleDescriptionPage()));*/
  }
}

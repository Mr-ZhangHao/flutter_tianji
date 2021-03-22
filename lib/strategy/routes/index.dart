import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/routes/router_init.dart';
import 'package:flutter_tianji/strategy/views/AllStrategy.dart';
import 'package:flutter_tianji/strategy/views/accountDetail.dart';
import 'package:flutter_tianji/strategy/views/addBindAccount.dart';
import 'package:flutter_tianji/strategy/views/bindingAccount.dart';
import 'package:flutter_tianji/strategy/views/detail/strategyOrderDetail.dart';
import 'package:flutter_tianji/strategy/views/genDan.dart';
import 'package:flutter_tianji/strategy/views/gensui/genSuiDetail.dart';
import 'package:flutter_tianji/strategy/views/gensui/genSuiRecord.dart';
import 'package:flutter_tianji/strategy/views/myInterest.dart';
import 'package:flutter_tianji/strategy/views/record/tradeRecord.dart';

class StrategyRouter implements IRouterProvider {
  static String allStrategy = '/AllStrategy';
  static String bindingAccounts = '/bindingAccount';
  static String addBindAccounts = '/addBindAccount';
  static String myInterests = '/myInterest';
  static String genDan = '/genDanPage';
  static String accountDetail = '/accountDetail';
  static String tradeRecord = '/tradeRecord';
  static String genSuiRecord = '/genSuiRecord';
  static String strategyOrderDetail = '/strategyOrderDetail';
  static String genSuiDetail = '/genSuiDetail';

  @override
  void initRouter(FluroRouter router) {
    router.define(allStrategy, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      //  var types = params['type'].first;
      return AllStrategy();
    }));
    router.define(bindingAccounts, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      //  var coinName = params['coinName'].first;
      return bindingAccount();
    }));
    router.define(addBindAccounts, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var types = params['type'].first; //1是交易员 2是跟随者
      var editor = params['editorId'].first; //1是编辑
      return addBindAccount(
        type: types,
        editorId: editor,
      );
    }));
    router.define(myInterests, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      //  var types = params['type'].first;
      return myInterest();
    }));
    router.define(genDan, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var apiId = params['apiId'].first;
      var types = params['type'].first;
      var platformID = params['platformID'].first;
      return genDanPage(
        type: types,
        followApiId: apiId,
        platformID: platformID,
      );
    }));
    router.define(accountDetail, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var id = params['id'].first;
      return accountDetailPage(
        id: id,
      );
    }));
    router.define(tradeRecord, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var id = params['id'].first;
      var type = params['type'].first;
      return tradeRecordPage(
        apiId: id,
        type: type,
      );
    }));
    router.define(genSuiRecord, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var id = params['id'].first;
      var type = params['type'].first;
      return genSuiRecordPage(id: id, type: type);
    }));
    router.define(strategyOrderDetail, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var apiId = params['apiId'].first;
      return strategyOrderDetailPage(apiId: apiId);
    }));
    router.define(genSuiDetail, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var id = params['id'].first;
      var type = params['type'].first;
      var follow_api_id = params['follow_api_id'].first;
      var isHistory = params['history'].first;

      return genSuiDetailPage(
        apiId: id,
        follow_api_id: follow_api_id,
        type: type,
        isHistory: isHistory,
      );
    }));
  }
}

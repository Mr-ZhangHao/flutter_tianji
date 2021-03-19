/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Jack
* @LastEditTime: 2020-08-18 13:57:22
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/routes/index.dart
*/
import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/business/views/CollectTaskList.dart';
import 'package:flutter_tianji/business/views/CreateProtective.dart';
import 'package:flutter_tianji/business/views/ExpandAddress.dart';
import 'package:flutter_tianji/business/views/TradeProtection.dart';
import 'package:flutter_tianji/business/views/TransactionRecordPage.dart';
import 'package:flutter_tianji/business/views/addressManagement.dart';
import 'package:flutter_tianji/business/views/auditRecord.dart';
import 'package:flutter_tianji/business/views/taskAllocation.dart';
import 'package:flutter_tianji/business/views/tradeRecordDetail.dart';
import 'package:flutter_tianji/business/views/tradeSatistic.dart';
import 'package:flutter_tianji/routes/router_init.dart';

class BusinessRouter implements IRouterProvider {
  static String transactionRecord = '/TransactionRecord';
  static String ExpandAddress = '/ExpandAddressPage';
  static String TradeProtection = '/TradeProtectionPage';
  static String CreateProtective = '/CreateProtectivePage';
  static String tradeStatistic = '/tradeStatistic';
  static String auditRecord = '/auditRecordPage';
  static String CollectTaskList = '/CollectTaskListPage';
  static String taskAllocation = '/taskAllocationPage';
  static String tradeRecordDetail = '/tradeRecordDetailPage';

  static String addressManagement = '/addressManagementPage';

  @override
  @override
  void initRouter(FluroRouter router) {
    router.define(addressManagement,
        handler: Handler(handlerFunc: (_, __) => addressManagementPage()));
    router.define(transactionRecord,
        handler: Handler(handlerFunc: (_, __) => TransactionRecord()));
    router.define(ExpandAddress,
        handler: Handler(handlerFunc: (_, __) => ExpandAddressPage()));
    router.define(TradeProtection,
        handler: Handler(handlerFunc: (_, __) => TradeProtectionPage()));
    router.define(CreateProtective,
        handler: Handler(handlerFunc: (_, __) => CreateProtectivePage()));
    router.define(tradeStatistic,
        handler: Handler(handlerFunc: (_, __) => tradeStatisticPage()));
    router.define(auditRecord,
        handler: Handler(handlerFunc: (_, __) => auditRecordPage()));
    router.define(taskAllocation,
        handler: Handler(handlerFunc: (_, __) => taskAllocationPage()));
    router.define(tradeRecordDetail,
        handler: Handler(handlerFunc: (_, __) => tradeRecordDetailPage()));

    router.define(CollectTaskList,
        handler: Handler(handlerFunc: (_, __) => CollectTaskListPage()));
  }
}

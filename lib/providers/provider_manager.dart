/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-03-24 10:08:21
* @LastEditors: Jack
* @LastEditTime: 2020-08-09 23:56:50
* @Deprecated: 否
* @FilePath: /ETF/lib/providers/provider_manager.dart
*/
import 'package:flutter_tianji/home/provider/index.dart';
import 'package:flutter_tianji/login/provider/user_provider.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/providers/gloable_provider.dart';
import 'package:flutter_tianji/providers/local_provider.dart';
import 'package:flutter_tianji/providers/theme_provider.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => LocalProvider()),
  ChangeNotifierProvider(create: (_) => GloableProvider()),
  ChangeNotifierProvider(create: (_) => WallerProvider()),
  ChangeNotifierProvider(create: (_) => MineProvider()),
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => StrategyProvider()),
  ChangeNotifierProvider(create: (_) => HomeProvider()),
];

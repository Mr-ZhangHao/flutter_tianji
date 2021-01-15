/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-06-01 13:46:53
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 10:45:44
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/providers/gloable_provider.dart
*/
import 'package:flutter/cupertino.dart';

///全局控制器
class GloableProvider extends ChangeNotifier {
  ///底部选项卡角标
  int bottomCurrIndex = 0;

  ///切换页面`
  setCurrIndex(int index) {
    bottomCurrIndex = index;
    print(index);
    notifyListeners();
  }
}

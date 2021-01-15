/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-10 14:58:02
* @LastEditors: Jack
* @LastEditTime: 2020-08-01 19:20:06
* @Deprecated: 否
* @FilePath: /ETF/lib/routes/404.dart
*/
import 'package:flutter/material.dart';

class WidgetNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面不存在'),
      ),
      body: Center(
        child: Text('页面不存在'),
      ),
    );
  }
}

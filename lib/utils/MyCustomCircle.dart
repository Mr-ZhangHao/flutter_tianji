import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/model/pieData.dart';
import 'package:flutter_tianji/utils/pieChart.dart';

///自定义  饼状图
/// @author yinl
class MyCustomCircle extends StatelessWidget {
  //数据源
  List<PieData> datas;
  //当前数据对象
  PieData data;
  var dataSize;
  //当前选中
  var currentSelect;

  MyCustomCircle(this.datas, this.data, this.currentSelect);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MyView(datas, data, currentSelect, true));
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';

class accountPage extends StatefulWidget {
  final StrategyProvider model;
  accountPage({Key key, this.model}) : super(key: key);
  @override
  _accountPageState createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  final Color leftBarColor = const Color(0xff52BEB4); //买入
  final Color rightBarColor = const Color(0xffEF726F); //卖出

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  // 第一条线
  List<FlSpot> spots1 = [FlSpot(1.0, 10), FlSpot(2.0, 8), FlSpot(3.0, 9)];

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> rawBarGroups;

    final items = [
      makeGroupData(
        1,
        10,
      ),
      makeGroupData(
        1,
        10,
      ),
      makeGroupData(
        2,
        8,
      ),
      makeGroupData(
        3,
        9,
      ),
      makeGroupData(
        4,
        5,
      ),
    ];

    rawBarGroups = items;
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: height(20), horizontal: width(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minWidth: width(115),
                          minHeight: height(40),
                        ),
                        child: Utils.normalText('收益率'),
                      ),
                      SizedBox(
                        width: width(40),
                      ),
                      Utils.normalText(
                          '${widget.model.mStrategyDetailModel.profitRate}%',
                          color: Color(0xff46A578)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          constraints: BoxConstraints(
                            minWidth: width(115),
                            minHeight: height(40),
                          ),
                          child: Utils.normalText('交易胜率')),
                      SizedBox(
                        width: width(40),
                      ),
                      Utils.normalText(
                          '${widget.model.mStrategyDetailModel.victoryRate}%'),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          constraints: BoxConstraints(
                            minWidth: width(115),
                            minHeight: height(40),
                          ),
                          child: Utils.normalText('总收益')),
                      SizedBox(
                        width: width(40),
                      ),
                      Utils.normalText(
                          '${widget.model.mStrategyDetailModel.profit}',
                          color: Color(0xff46A578)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          constraints: BoxConstraints(
                            minWidth: width(115),
                            minHeight: height(40),
                          ),
                          child: Utils.normalText('资产余额')),
                      SizedBox(
                        width: width(40),
                      ),
                      Utils.normalText(
                          '${widget.model.mStrategyDetailModel.balance}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Utils.normalText('总收益',
              fontWeight: FontWeight.bold, textAlign: TextAlign.start),
          SizedBox(
            height: height(40),
          ),
          /* 折线图 */
          LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: const Color(0xff37434d),
                    strokeWidth: 0.5,
                  );
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  colors: gradientColors,
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  ),
                  spots: spots1,
                ),
              ],
            ),
          ),

          /* 条形图 */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils.normalText('总收益', fontWeight: FontWeight.bold),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 2.0,
                      backgroundColor: Color(0xff52BEB4),
                    ),
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText('买入', color: Color(0xff52BEB4)),
                  SizedBox(
                    width: width(30),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 2.0,
                      backgroundColor: Color(0xffEF726F),
                    ),
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText('卖出', color: Color(0xffEF726F)),
                ],
              )
            ],
          ),
          SizedBox(
            height: height(40),
          ),
          BarChart(BarChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 0.1,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: rawBarGroups,
          )),
          SizedBox(
            height: height(20),
          ),
          /* 饼状图 */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils.normalText('日交易笔数 01-06至01-10',
                  fontWeight: FontWeight.bold),
              Utils.normalText('4笔', color: Color(0xff52BEB4)),
            ],
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: PieChart(
              PieChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections()),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Indicator(
                size: 12,
                color: Color(0xff52BEB4),
                text: '盈利笔数4笔',
                isSquare: true,
              ),
              SizedBox(
                width: 20,
              ),
              Indicator(
                size: 12,
                color: Color(0xffEF726F),
                text: '亏损1笔',
                isSquare: true,
              ),
            ],
          ),
        ],
      ),
    ));
  }

  /* 条形图 */
  BarChartGroupData makeGroupData(
    int x,
    double y1,
  ) {
    return BarChartGroupData(barsSpace: 0, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: 5,
      ),
    ]);
  }

  /* 饼状图 */
  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff52BEB4),
            value: 40,
            title: '80%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffEF726F),
            value: 30,
            title: '20%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          return null;
      }
    });
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/mine/server/index.dart';
import 'package:flutter_tianji/mine/model/StandardModel.dart';

class tariffStandardPage extends StatefulWidget {
  @override
  _tariffStandardPageState createState() => _tariffStandardPageState();
}

class _tariffStandardPageState extends State<tariffStandardPage> {
  List<Withdraw> datas;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadStandard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('资费标准'),
          centerTitle: true,
          elevation: 0.5,
          leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => RouterUtil.goBack(context),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/mine/back@2x.png',
                    width: width(22), height: height(36)),
              )),
        ),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: width(30), right: width(30)),
            child: datas != null
                ? ListView.builder(
                    itemCount: datas != null ? datas.length : 0,
                    itemBuilder: (context, i) {
                      print(i);
                      return Container(
                        height: height(240),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Color(0xffEBEBEB)))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.normalText('${datas[i].name}',
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              height: height(40),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Utils.normalText(
                                    '提币手续费：${datas[i].fee.toString()}',
                                    color: Color(0xff909090)),
                                SizedBox(
                                  width: width(40),
                                ),
                                Utils.normalText(
                                    '单笔限额：${datas[i].singleMax.toString()}',
                                    color: Color(0xff909090)),
                              ],
                            ),
                            SizedBox(
                              height: height(40),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Utils.normalText(
                                    '最小提币量：${datas[i].min.toString()}',
                                    color: Color(0xff909090)),
                                SizedBox(
                                  width: width(30),
                                ),
                                Utils.normalText(
                                    '每日限额：${datas[i].dayMax.toString()}',
                                    color: Color(0xff909090)),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                : Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset(
                          'images/business/no_task.png',
                          fit: BoxFit.fitWidth,
                          width: width(230),
                          height: height(150),
                        ),
                        SizedBox(height: height(12)),
                        Utils.normalText(
                          '暂无数据',
                        )
                      ]))));
  }

  loadStandard() async {
    var res = await MineServer.getRate();
    List<Withdraw> rates = (res['data']['withdraw'] as List)
        .map((e) => Withdraw.fromJson(e))
        .toList();
    print("111111111");
    if (res['code'] == 200) {
      print("22222222");
      setState(() {
        datas = rates;
      });
    }
  }
}

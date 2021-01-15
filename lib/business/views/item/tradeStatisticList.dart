import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/model/TradeStatisticModel.dart';
import 'package:flutter_tianji/business/views/record_ListView.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/home/model/transfer_model.dart';
import 'package:flutter_tianji/utils/screen.dart';

/* 交易统计 */
class TradeStatisticListView extends PageList {
  TradeStatisticListView({Key key}) : super(key: key);

  @override
  _TradeStatisticListViewState createState() => _TradeStatisticListViewState();
}

class _TradeStatisticListViewState
    extends PageListState<TradeStatisticModel, TransactionRecordListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Color(0xffF9F8FA),
            height: height(80),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  '币种',
                  style: TextStyle(fontSize: sp(28), color: Color(0xff7d7d7d)),
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  '转入量',
                  style: TextStyle(fontSize: sp(28), color: Color(0xff7d7d7d)),
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  '转出量',
                  style: TextStyle(fontSize: sp(28), color: Color(0xff7d7d7d)),
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  '余额',
                  style: TextStyle(fontSize: sp(28), color: Color(0xff7d7d7d)),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
          Expanded(child: buildList(context))
        ],
      ),
    );
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<TradeStatisticModel>) onSuccess,
      Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      var data = [TradeStatisticModel(), TradeStatisticModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(TradeStatisticModel model) {
    TextStyle styleSm = TextStyle(fontSize: sp(28), color: Color(0xff323232));
    return Container(
      alignment: Alignment.center,
      height: height(98),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/home/laba.png',
                  width: width(44), height: height(44)),
              SizedBox(
                width: width(20),
              ),
              Text('BTH', style: styleSm),
            ],
          )),
          Expanded(
              child: Text(
            'BTH',
            style: styleSm,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            'BTH',
            style: styleSm,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            'BTH',
            style: styleSm,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }

  @override
  empty() {
    return SizedBox();
  }
}

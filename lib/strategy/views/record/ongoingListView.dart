import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/strategy/model/ongoingListViewModel.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

/*  
用户交易记录列表
 */
class ongoingListView extends PageList {
  final int index;
  final int type; //1 账户详情交易记录  2 跟随详情交易记录
  final String follow_api_id;
  final String apiId;
  ongoingListView(
      {Key key, this.index, this.follow_api_id, this.apiId, this.type})
      : super(key: key);
  @override
  _allStrategyListViewState createState() => _allStrategyListViewState();
}

class _allStrategyListViewState
    extends PageListState<ongoingListViewModel, ongoingListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
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
      Function(List<ongoingListViewModel>) onSuccess,
      Function onErr}) async {
    try {
      var data;
      if ((widget as ongoingListView).type == 1) {
        data = await StrategyServer.getTransactionRecord({
          "status": (widget as ongoingListView).index,
        });
      } else {
        data = await StrategyServer.getTransactionRecord({
          "status": (widget as ongoingListView).index,
          "api_id": (widget as ongoingListView).apiId,
          "follow_api_id": (widget as ongoingListView).follow_api_id,
        });
      }

      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(ongoingListViewModel model) {
    return (widget as ongoingListView).index == 6
        ? InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width(20), vertical: width(20)),
              height: height(200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Utils.normalText('${model.instrument_id}'),
                      SizedBox(
                        width: width(20),
                      ),
                      getType(model.type, model.side ?? ""),
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('成交数量(张)', color: Color(0xffA5A5A5)),
                      Utils.normalText('成交均价', color: Color(0xffA5A5A5)),
                    ],
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('${model.filledQty ?? 0}'),
                      Utils.normalText('${model.priceAvg ?? 0.00}'),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {})
        : InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width(20), vertical: width(20)),
              height: height(300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Utils.normalText('${model.instrument_id}'),
                  SizedBox(
                    height: height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getType(model.type, model.side ?? ""),
                      Utils.normalText('${model.timestamp ?? "-"}',
                          color: Color(0xffC0C0C0)),
                      Utils.normalText(getState(model.state ?? 2),
                          color: Color(0xffC0C0C0)),
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('委托价', color: Color(0xffA5A5A5)),
                      Utils.normalText('委托量(手)', color: Color(0xffA5A5A5)),
                      Utils.normalText('成交量(手)', color: Color(0xffA5A5A5)),
                    ],
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('${model.price ?? "-"}'),
                      Utils.normalText('${model.size ?? "-"}'),
                      Utils.normalText('${model.filledQty ?? "-"}'),
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('成交均价', color: Color(0xffA5A5A5)),
                      Utils.normalText('已实现盈亏(USDT)', color: Color(0xffA5A5A5)),
                      Utils.normalText('手续费(USDT)', color: Color(0xffA5A5A5)),
                    ],
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('${model.priceAvg ?? "-"}'),
                      Utils.normalText('${model.pnl ?? "-"}'),
                      Utils.normalText('${model.fee ?? "-"}',
                          color: Color(0xffD45151)),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {});
  }

  Widget getType(type, side) {
    switch (type) {
      case 0:
        return Utils.normalText(
            side != null && side.toString().isNotEmpty
                ? side == "buy"
                    ? "买入"
                    : "卖出"
                : "",
            color: Color(0xffFF4242),
            fontWeight: FontWeight.w700);
        break;
      case 1:
        return Utils.normalText('开多',
            color: Color(0xffFF4242), fontWeight: FontWeight.w700);
        break;
      case 2:
        return Utils.normalText('开空',
            color: Color(0xff48BE70), fontWeight: FontWeight.bold);
        break;
      case 3:
        return Utils.normalText('平多',
            color: Color(0xffFF4242), fontWeight: FontWeight.bold);
        break;
      case 4:
        return Utils.normalText('平空',
            color: Color(0xff48BE70), fontWeight: FontWeight.bold);
        break;
    }
  }

  String getState(type) {
    switch (type) {
      case -2:
        return '失败';
      case -1:
        return '撤单成功';
      case 0:
        return '等待成交';
      case 1:
        return '部分成交';
      case 2:
        return '完成成交';
      case 3:
        return '下单中';
      case 4:
        return '撤单中';
    }
  }

  @override
  empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/business/no_task.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text('${Tr.of(context).homeNodata}',
              style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }
}

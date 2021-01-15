import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/model/auditRecordModel.dart';
import 'package:flutter_tianji/business/views/item/auditRecord_item.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/utils/screen.dart';

/* 审核记录列表 */
class auditRecordListPage extends PageList {
  auditRecordListPage({Key key}) : super(key: key);
  @override
  _auditRecordListPageState createState() => _auditRecordListPageState();
}

class _auditRecordListPageState
    extends PageListState<auditRecordModel, auditRecordListPage> {
  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
    );
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<auditRecordModel>) onSuccess,
      Function onErr}) async {
    try {
      /*   List<BibiRecored> list = await WalletServer.bibiRecord({
        "coin_id": params['coin_id'],
        "type": params['type'],
        "time": params['time'],
        "page": page,
        "per_page": 10,
      });*/
      var data = [auditRecordModel(), auditRecordModel()];
      onSuccess(data);
    } catch (e) {
      onErr(e);
    }
  }

  @override
  buildItem(auditRecordModel model) {
    return Container(
      width: double.infinity,
      height: height(290),
      padding: EdgeInsets.symmetric(horizontal: width(24)),
      child: auditRecordItem(model: model),
    );
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

  @override
  buildFooter() {
    return SizedBox(
      child: Text('${Tr.of(context).assetNoMore}'),
    );
  }
}

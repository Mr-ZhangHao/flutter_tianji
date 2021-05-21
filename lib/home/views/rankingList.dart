import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tianji/baike/model/collectionListModel.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/baike/server/index.dart';

import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/home/model/rankingModel.dart';
import 'package:flutter_tianji/home/server/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';


class rankingListPage extends PageList {


  rankingListPage({Key key,}) : super(key: key);
  @override
  _rankingListPageState createState() => _rankingListPageState();
}

class _rankingListPageState
    extends PageListState<rankingModel, rankingListPage> {

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


  @override
  buildItem1(rankingModel model, int index) {
    return  InkWell(
        highlightColor: Colors.transparent,
        radius: 0.0,
        child: Container(
          width: double.infinity,
          height: height(152),
          padding: EdgeInsets.symmetric(horizontal: width(24)),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: width(200),
                child:  Utils.normalText("${index}", textAlign: TextAlign.center),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                model.avatar == null
                ? Image.asset(
                    'images/home/icon_quantify.png',
                    width: 40,
                    height: 40)
                      : ClipOval(
              child: Image.network(
              '${model.avatar}',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40)),
                    SizedBox(
                      width: width(20),
                    ),
                    Utils.normalText("${model.username}", textAlign: TextAlign.left)
                  ],
                ),
                flex: 2,
              ),
              Container(
                alignment: Alignment.center,
                width: width(200),
                child:  Utils.normalText("+${model.rate}%", color: Colors.red,textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        onTap: () {
/*          RouterUtil.pushResult(context,
              "${BaikeRouter.projectDetils}?type=${model.id}", (result) {});*/
        },
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
  ///加载数据
  @override
  loadPage(
      {int page,
        Function(List<rankingModel>) onSuccess,
        Function onErr}) async {
    try {
      List<rankingModel> data = await HomeServer.getranking();
      //  var data = [projectListModel(), projectListModel()];
      onSuccess(data);
    } catch (e) {
      onErr(e);
    }
  }

  @override
  buildFooter() {
    return SizedBox(
      child: Text('${Tr.of(context).assetNoMore}'),
    );
  }
}

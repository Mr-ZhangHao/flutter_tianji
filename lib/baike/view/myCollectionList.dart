import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tianji/baike/model/collectionListModel.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/baike/server/index.dart';

import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';


class myCollectionListPage extends PageList {


  myCollectionListPage({Key key,}) : super(key: key);
  @override
  _myCollectionListState createState() => _myCollectionListState();
}

class _myCollectionListState
    extends PageListState<collectionListModel, myCollectionListPage> {

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
  buildItem1(collectionListModel model, int index) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      //滑出选项的面板 动画
      actionExtentRatio: 0.25,
      child: InkWell(
        highlightColor: Colors.transparent,
        radius: 0.0,
        child: Container(
          width: double.infinity,
          height: height(152),
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('images/home/icon_quantify.png',
                        width: width(72), height: height(72)),
                    SizedBox(
                      width: width(20),
                    ),
                   Utils.normalText("${model.encyclopediaName}", textAlign: TextAlign.left)
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                  child: Utils.normalText("${model.cateName}",
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Utils.normalText("${model.level}",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold)),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Utils.normalText("${model.cateName}",
                      textAlign: TextAlign.center),
                  Container(
                    width: width(100),
                    height: height(44),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0XFFFFE0E0),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Text('+${model.rate.toString()}%',
                        style: TextStyle(
                            fontSize: sp(20), color: Color(0XFFFF4E4E))),
                  )
                ],
              )),
            ],
          ),
        ),
        onTap: () {
          RouterUtil.pushResult(context,
              "${BaikeRouter.projectDetils}?type=${model.id}", (result) {});
        },
      ),
      key: UniqueKey(),
      secondaryActions: <Widget>[
        //右侧按钮列表
        IconSlideAction(
          caption: '取消',
          color: Colors.red,
          closeOnTap: false,
          onTap: () {
            // 删除后刷新列表，以达到真正的删除
            Toast.showLoading('loading...');

            baikeServer.cancelCollect(model.id);
            Future.delayed(Duration(seconds: 1), () {
              items.removeAt(index);
              loadData(1);
            });
          },
        ),
      ],
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
        Function(List<collectionListModel>) onSuccess,
        Function onErr}) async {
    try {
      List<collectionListModel> data = await baikeServer.getCollectionList();
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

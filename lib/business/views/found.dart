import 'package:flutter/material.dart';
import 'package:flutter_tianji/business/model/FoundListModel.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/utils/screen.dart';

class FoundListView extends PageList {
  FoundListView({Key key}) : super(key: key);

  @override
  _FoundViewState createState() => _FoundViewState();
}

class _FoundViewState extends PageListState<FoundListModel, FoundListView> {
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
      Function(List<FoundListModel>) onSuccess,
      Function onErr}) async {
    try {
      // var data = await HomeServer.advisory(page);
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
      var data = [FoundListModel(), FoundListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(FoundListModel model) {
    return Container(
        height: height(320),
        width: double.infinity,
        margin: EdgeInsets.only(
          left: width(30),
          right: width(30),
        ),
        child: Image.asset(
          'images/business/banner@2x.png',
        ) /* model == null
          ? Image.asset(
              'images/business/banner@2x.png',
            )
          : Image.network(""), */
        );
  }

  @override
  empty() {
    return SizedBox();
  }
}

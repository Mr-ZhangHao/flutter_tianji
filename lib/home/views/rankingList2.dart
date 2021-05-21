import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/home/model/rankingModel.dart';
import 'package:flutter_tianji/home/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class rankingList2 extends PageList {
  @override
  _rankingList2State createState() => _rankingList2State();
}

class _rankingList2State extends PageListState<rankingModel,rankingList2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
    );
  }

  @override
  void initState() {
    isPostion = true;

    loadData(1);
    super.initState();

  }

  ///加载数据
  @override
  loadPage(
      {int page,
        Function(List<rankingModel>) onSuccess,
        Function onErr}) async {
    try {
      var data = await HomeServer.getranking();
      //  var data = [projectListModel(), projectListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem1(rankingModel model, int index) {
    return InkWell(
      highlightColor: Colors.transparent,
      radius: 0.0,
      child: Container(
        width: double.infinity,
        height: height(102),
        padding: EdgeInsets.symmetric(horizontal: width(34)),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: width(150),
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
              alignment: Alignment.centerRight,
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
}

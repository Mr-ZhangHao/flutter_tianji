/* 项目列表 */
import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/model/projectListModel.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class projectListPage extends PageList {
  projectListPage({Key key}) : super(key: key);
  @override
  _projectListPageState createState() => _projectListPageState();
}

class _projectListPageState
    extends PageListState<projectListModel, projectListPage> {
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
      Function(List<projectListModel>) onSuccess,
      Function onErr}) async {
    try {
      /*   List<BibiRecored> list = await WalletServer.bibiRecord({
        "coin_id": params['coin_id'],
        "type": params['type'],
        "time": params['time'],
        "page": page,
        "per_page": 10,
      });*/
      var data = [projectListModel(), projectListModel()];
      onSuccess(data);
    } catch (e) {
      onErr(e);
    }
  }

  @override
  buildItem(projectListModel model) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: height(152),
        padding: EdgeInsets.symmetric(horizontal: width(24)),
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
                  Utils.normalText("海马量化", textAlign: TextAlign.left)
                ],
              ),
              flex: 2,
            ),
            Expanded(
                child: Utils.normalText("流动挖矿", textAlign: TextAlign.center)),
            Expanded(
                child: Utils.normalText("A",
                    textAlign: TextAlign.center, fontWeight: FontWeight.bold)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Utils.normalText("1000", textAlign: TextAlign.center),
                Container(
                  width: width(100),
                  height: height(44),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFE0E0),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Text('+1.78%',
                      style: TextStyle(
                          fontSize: sp(20), color: Color(0XFFFF4E4E))),
                )
              ],
            )),
          ],
        ),
      ),
      onTap: () {
        RouterUtil.push(context, BaikeRouter.projectDetil);
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

  @override
  buildFooter() {
    return SizedBox(
      child: Text('${Tr.of(context).assetNoMore}'),
    );
  }
}

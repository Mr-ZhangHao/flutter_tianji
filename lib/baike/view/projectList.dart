/* 项目列表 */
import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/model/projectListModel.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/baike/server/index.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/event/projectListEvent.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/routes/application.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:flutter_tianji/wallet/model/bibi_recored_model.dart';
import 'package:flutter_tianji/wallet/server/index.dart';

class projectListPage extends PageList {
  final int level;
  final int id;

  projectListPage({Key key,this.id,this.level}) : super(key: key);
  @override
  _projectListPageState createState() => _projectListPageState();
}

class _projectListPageState
    extends PageListState<projectListModel, projectListPage> {


  Object level;
  int id;


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
    //监听事件总线上数据变化
    Application.eventBus.on<projectListEvent>().listen((event) {
      if (mounted) {
        setState(() {
          id = event.id;
          level = event.level;
          loadData(1);
        });
      }
    });
  }

  ///加载数据
  @override
  loadPage(
      {int page,
        Function(List<projectListModel>) onSuccess,
        Function onErr}) async {
    try {
      var datas ={
        "cate_id": id,
        "level": level,
      };
      var data = await baikeServer.getprojectList(datas);
      //  var data = [projectListModel(), projectListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(projectListModel model) {
    return InkWell(
      highlightColor: Colors.transparent,
      radius: 0.0,
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
                      width: 36, height: 36),
                  SizedBox(
                    width: width(20),
                  ),
                  Utils.normalText("${model.name}", textAlign: TextAlign.left)
                ],
              ),
              flex: 2,
            ),
            Expanded(
                child: Utils.normalText("${model.cateName}",color: Color(0xff999999), textAlign: TextAlign.center)),
            Expanded(
                child: Utils.normalText("${model.level}",
                    textAlign: TextAlign.center, fontWeight: FontWeight.bold)),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Utils.normalText("${model.score.toString()}", textAlign: TextAlign.center),
                    Container(
                      width: width(100),
                      height: height(44),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0XFFFFE0E0),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Text('+${model.rate}%',
                          style: TextStyle(
                              fontSize: sp(20), color: Color(0XFFFF4E4E))),
                    )
                  ],
                )),
          ],
        ),
      ),
      onTap: () {
        print("id:"+model.id.toString());
        RouterUtil.pushResult(
            context,
            "${BaikeRouter.projectDetils}?type=${model.id}",
                (result) {});
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

import 'package:flutter/material.dart';
import 'package:flutter_tianji/mine/provider/mine_provider.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class buddyListPage extends StatefulWidget {
  @override
  _buddyListPageState createState() => _buddyListPageState();
}

class _buddyListPageState extends State<buddyListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MineProvider>(context, listen: false).getBuddyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的好友'),
          centerTitle: true,
          elevation: 1,
          leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => RouterUtil.goBack(context),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/mine/back@2x.png',
                    width: width(22), height: height(36)),
              )),
        ),
        body: Consumer<MineProvider>(
            builder: (BuildContext context, MineProvider model, Widget child) {
          print('model:' + model?.buddyListModel?.length.toString());
          return model.buddyListModel.length > 0
              ? Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: width(20), right: width(20)),
                  child: ListView.builder(
                      itemCount: model?.buddyListModel?.length ?? 0,
                      itemBuilder: (context, i) {
                        return Container(
                          height: height(102),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffEBEBEB)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Utils.normalText(
                                    '${model?.buddyListModel[i]?.mobile}',
                                    textAlign: TextAlign.left,
                                    fontSize: 25),
                              ),
                              Expanded(
                                child: Utils.normalText(
                                    '${model?.buddyListModel[i]?.createdAt}',
                                    textAlign: TextAlign.center,
                                    fontSize: 25),
                              ),
                              Expanded(
                                child: Utils.normalText(
                                    model?.buddyListModel[i]?.status == 0
                                        ? '有效'
                                        : '无效',
                                    textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        );
                      }),
                )
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
                    ]));
        }));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tianji/baike/provider/baike_provider.dart';
import 'package:flutter_tianji/baike/routes/index.dart';
import 'package:flutter_tianji/baike/view/myCollectionList.dart';
import 'package:flutter_tianji/baike/view/projectList.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tianji/baike/server/index.dart';

class myCollection extends StatefulWidget {
  @override
  _myCollectionState createState() => _myCollectionState();
}

class _myCollectionState extends State<myCollection> {
  @override
  void initState() {
    super.initState();

    Provider.of<baikeProvider>(context, listen: false).getCollectionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text('我的关注'),
        centerTitle: true,
        elevation: 0.5,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => RouterUtil.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png',
                  width: width(22), height: height(36)),
            )),
      ),
      body: Consumer<baikeProvider>(
          builder: (BuildContext context, baikeProvider model, Widget child) {
        return model.isIdle ? Column(
          children: [
            Container(
              height: height(88),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child:
                          Utils.normalText('名称', textAlign: TextAlign.center,color: Color(0xff666666)),flex: 2,),
                  Expanded(
                      child:
                          Utils.normalText('分类', textAlign: TextAlign.center,color: Color(0xff666666))),
                  Expanded(
                      child:
                          Utils.normalText('评级', textAlign: TextAlign.center,color: Color(0xff666666))),
                  Expanded(
                      child:
                          Utils.normalText('热度', textAlign: TextAlign.center,color: Color(0xff666666)),),
                  /*      Container(
                      padding: EdgeInsets.symmetric(horizontal: width(20)),
                      child: Image.asset('images/business/icon_screen.png',
                          width: width(48), height: height(48))) */
                ],
              ),
            ),
            Divider(height: height(2),color: Color(0xffDDDDDD),),
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: model.collectionList.length >
                        0
                    ? ListView.builder(
                       shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.collectionList.length,
                        itemBuilder: (BuildContext context, int index) {
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
                                padding:
                                    EdgeInsets.symmetric(horizontal: width(24)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                              'images/home/icon_quantify.png',
                                              width: width(72),
                                              height: height(72)),
                                          SizedBox(
                                            width: width(20),
                                          ),
                                          Utils.normalText(
                                              "${model.collectionList[index].encyclopediaName}",
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                        child: Utils.normalText(
                                            "${model.collectionList[index].cateName}",
                                            textAlign: TextAlign.center)),
                                    Expanded(
                                        child: Utils.normalText(
                                            "${model.collectionList[index].level}",
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.bold)),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Utils.normalText("${model.collectionList[index].cateName}",
                                            textAlign: TextAlign.center),
                                        Container(
                                          width: width(100),
                                          height: height(44),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0XFFFFE0E0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                          ),
                                          child: Text('+${model.collectionList[index].rate.toString()}%',
                                              style: TextStyle(
                                                  fontSize: sp(20),
                                                  color: Color(0XFFFF4E4E))),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              onTap: () {
                                RouterUtil.pushResult(
                                    context,
                                    "${BaikeRouter.projectDetils}?type=${model.collectionList[index].encyclopedia}",
                                    (result) {});
                              },
                            ),
                            key: UniqueKey(),
                            secondaryActions: <Widget>[
                              //右侧按钮列表
                              SlideAction(
                                child: Utils.normalText( '取消',color: kWhite),
                                color: Colors.red,
                                closeOnTap: false,
                                onTap: () async {
                                  // 删除后刷新列表，以达到真正的删除
                                  Toast.showLoading('loading...');

                                  await baikeServer.cancelCollect(model.collectionList[index].encyclopedia);
                                  Future.delayed(Duration(seconds: 1), () {
                                   //  items.removeAt(index);
                                    // loadData(1);
                                    Provider.of<baikeProvider>(context, listen: false).getCollectionList();
                                  });
                                },
                              ),
                            ],
                          );
                        })
                    :  Expanded(

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
                )),
            //  Expanded(child: myCollectionListPage())
          ],
        ):Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}

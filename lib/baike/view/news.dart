
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tianji/baike/model/NewsListModel.dart';
import 'package:flutter_tianji/baike/server/index.dart';
import 'package:flutter_tianji/baike/view/banner2.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/home/server/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class NewListView extends PageList {
  NewListView({Key key}) : super(key: key);

  @override
  _NewViewState createState() => _NewViewState();
}

class _NewViewState extends PageListState<NewsListModel, NewListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: kWhite,
      child: Column(
        children: [
          SwiperBanner(),
          Expanded(child:  buildList(context))
        ],
      ),
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
        Function(List<NewsListModel>) onSuccess,
        Function onErr}) async {
    try {
     var data = await baikeServer.getNewsList();
      // onSuccess((data['data']['records'] as List)
      //     .map((e) => NewsModel.fromJson(e))
      //     .toList());
     // var data = [NewsListModel(), NewsListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(NewsListModel model) {
    return Container(
      margin: EdgeInsets.all(width(40)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width(100),
                height: height(50),
                decoration: BoxDecoration(
                    color: Color(0xffFFF3F3),
                    border: new Border.all(
                        color: Color(0xffE94E4E),
                        width: width(2)),
                    borderRadius:
                    new BorderRadius.circular(
                        width(8))),
                alignment: Alignment.center,
                child: Text('专题',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffE94E4E),
                      fontSize: 12,
                    )),
              ),
              SizedBox(width: width(20),),
              Utils.normalText('${model.name}'),
            ],
          ),
          SizedBox(height: height(30),),
          Image.asset("images/baike/news_divider.png"),
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: model.journalism
                  .length >
                  0
                  ? ListView.builder(
                   shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.journalism.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1, color: Color(0xffF1F1F1)))
                        ),
                        height: height(200),
                        child: ListTile(
                          title: Utils.normalText('${model.journalism[index].title}',fontSize: 30,fontWeight: FontWeight.w500),
                          subtitle: Container(
                            margin: EdgeInsets.only(top: height(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Utils.normalText('${model.journalism[index].tag}',color: Color(0xffC0C0C0),fontSize: 24),
                                Utils.normalText('${model.journalism[index].createdAt}',color: Color(0xffC0C0C0),fontSize: 24)
                              ],
                            ),
                          ),
                          trailing: Container(

                            width: width(200),
                            height: height(140),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(width(5))),
                                color: kWhite),
                            child:Image.network('${model.journalism[index].images}',fit: BoxFit.fill,) ,
                          ),
                        ),
                      ),
                      onTap: (){
                           RouterUtil.goWebViewPage2(context,model.journalism[index].title,  model.journalism[index].descript, model.journalism[index].tag, model.journalism[index].createdAt, model.journalism[index].images);
                      },
                    );
                  })
                  : Container())
        ],
      ),
    );
  }

  @override
  empty() {
    return SizedBox();
  }
}
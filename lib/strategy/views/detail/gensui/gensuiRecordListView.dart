/*  
  订单详情跟随列表记录
 */
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/common/i18n/i18n.dart';
import 'package:flutter_tianji/common/refresh/page_list.dart';
import 'package:flutter_tianji/strategy/model/genSuiListViewModel.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/ExpansionLayout.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';

class gensuiRecordListView extends PageList {
  final int index;
  final String id;
  gensuiRecordListView({Key key, this.index, this.id}) : super(key: key);
  @override
  _gensuiRecordListViewtate createState() => _gensuiRecordListViewtate();
}

class _gensuiRecordListViewtate
    extends PageListState<genSuiListViewModel, gensuiRecordListView> {
  int postions = -1;
  @override
  // TODO: implement isPostion
  bool get isPostion => true;
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
      Function(List<genSuiListViewModel>) onSuccess,
      Function onErr}) async {
    try {
      var data = await StrategyServer.getGensuiRecord(
        (widget as gensuiRecordListView).index,
        (widget as gensuiRecordListView).id,
      );
      //   var data = [genSuiListViewModel(), genSuiListViewModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem1(genSuiListViewModel model, int postion) {
    return (widget as gensuiRecordListView).index == 1
        ? InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
              height: this.postions == postion ? height(360) : height(360),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          model.avatar == null
                              ? Image.asset('images/home/avatar.png',
                                  width: 40, height: 40)
                              : ClipOval(
                                  child: Image.network('${model.avatar}',
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40)),
                          SizedBox(
                            width: width(24),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Utils.normalText('${model.username ?? ""}'),
                              SizedBox(
                                height: height(20),
                              ),
                              Utils.normalText('${model.platform ?? ""}',
                                  color: Color(0xff999999)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Utils.normalText('数据详情', color: kPrimaryColor),
                          SizedBox(
                            width: width(14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('跟随币种', color: Color(0xffA5A5A5),fontSize: 26),
                      Utils.normalText('跟随收益', color: Color(0xffA5A5A5),fontSize: 26),
                      Utils.normalText('跟随笔数', color: Color(0xffA5A5A5),fontSize: 26),
                    ],
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 60,
                          child: Text(
                            '${model.coin}',
                            softWrap: true,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: sp(30),
                            ),
                          )),
                      Utils.normalText('${model.profit ?? ""}'),
                      Utils.normalText('${model.count ?? ""}'),
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  ExpansionLayout(
                      isExpanded: this.postions == postion,
                      children: [
                        Container(
                          height: height(140),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          decoration: BoxDecoration(
                              color: Color(0xFFF7F4FA),
                              border: new Border.all(
                                  color: Color(0xFFF7F4FA), width: width(2)),
                              borderRadius:
                                  new BorderRadius.circular(width(8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width(20),
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Utils.normalText(
                                    '跟随币种：',
                                    color: Color(0xff666666),
                                  ),
                                  SizedBox(height: height(10),),
                                  Utils.normalText(
                                    '跟随时间：',
                                    color: Color(0xff666666),
                                  ),
                                  SizedBox(height: height(10),),

                                  Utils.normalText(
                                    '跟随时长：',
                                    color: Color(0xff666666),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Utils.normalText(
                                    '${model.coin ?? ""}',
                                  ),
                                  SizedBox(height: height(10),),

                                  Utils.normalText('${model.createTime ?? ""}',
                                      textAlign: TextAlign.center),
                                  SizedBox(height: height(10),),

                                  Utils.normalText('${model.count ?? ""} 天',
                                      textAlign: TextAlign.center),
                                ],
                              )),
                              SizedBox(
                                width: width(20),
                              ),
                            ],
                          ),
                        ),
                      ])
                ],
              ),
            ),
            onTap: () {
              setState(() {
                if (this.postions == postion) {
                  this.postions = -1;
                } else {
                  this.postions = postion;
                }
              });
              print("postion:" + '${this.postions}');
            })
        : InkWell(
            highlightColor: Colors.transparent,
            radius: 0.0,
            child: Container(
              height: this.postions == postion ? height(360) : height(360),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          model.avatar == null
                              ? Image.asset('images/home/avatar.png',
                                  width: 40, height: 40)
                              : ClipOval(
                                  child: Image.network('${model.avatar}',
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40)),
                          SizedBox(
                            width: width(24),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Utils.normalText('${model.username ?? ""}'),
                              SizedBox(
                                height: height(20),
                              ),
                              Utils.normalText('${model.platform ?? ""}',
                                  color: Color(0xffA5A5A5)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Utils.normalText('数据详情', color: Color(0xff7865FE)),
                          SizedBox(
                            width: width(14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.normalText('跟随币种',
                          color: Color(0xffA5A5A5), fontSize: 26),
                      Utils.normalText('跟随收益',
                          color: Color(0xffA5A5A5), fontSize: 26),
                      Utils.normalText('跟随笔数',
                          color: Color(0xffA5A5A5), fontSize: 26),
                    ],
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 60,
                          child: Text(
                            '${model.coin ?? ""}',
                            softWrap: true,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: sp(30),
                            ),
                          )),
                      Utils.normalText('${model.profit ?? ""}',
                          textAlign: TextAlign.center),
                      Utils.normalText('${model.count ?? ""}',
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    height: height(24),
                  ),
                  ExpansionLayout(
                      isExpanded: this.postions == postion,
                      children: [
                        Container(
                          height: height(140),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          decoration: BoxDecoration(
                              color: Color(0xFFF7F4FA),
                              border: new Border.all(
                                  color: Color(0xFFF7F4FA), width: width(2)),
                              borderRadius:
                                  new BorderRadius.circular(width(8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width(20),
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Utils.normalText('跟随币种：',
                                      color: Color(0xff666666), fontSize: 26),
                                  Utils.normalText('跟随时间：',
                                      color: Color(0xff666666), fontSize: 26),
                                  Utils.normalText('跟随时长：',
                                      color: Color(0xff666666), fontSize: 26),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Utils.normalText(
                                    '${model.coin ?? ""}',
                                  ),
                                  Utils.normalText(
                                    '${model.createTime ?? ""}',
                                  ),
                                  Utils.normalText(
                                    '${model.time ?? ""} 天',
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: width(20),
                              ),
                            ],
                          ),
                        ),
                      ])
                ],
              ),
            ),
            onTap: () {
              setState(() {
                if (this.postions == postion) {
                  this.postions = -1;
                } else {
                  this.postions = postion;
                }
              });
              print("postion:" + '${this.postions}');
            });
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

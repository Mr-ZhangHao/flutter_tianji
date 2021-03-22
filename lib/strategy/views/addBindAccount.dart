import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tianji/common/input/focus.dart';
import 'package:flutter_tianji/common/qrscan/index.dart';
import 'package:flutter_tianji/common/toast/index.dart';
import 'package:flutter_tianji/login/widgets/text_input.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/strategy/provider/index.dart';
import 'package:flutter_tianji/strategy/server/index.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/utils/util.dart';
import 'package:provider/provider.dart';

class addBindAccount extends StatefulWidget {
  final String type;
  final String editorId;
  addBindAccount({Key key, this.type, this.editorId}) : super(key: key);

  @override
  _addBindAccountState createState() => _addBindAccountState();
}

class _addBindAccountState extends State<addBindAccount> {
  final _accesskeyCtr = TextEditingController();
  final FocusNode _accesskeyFocus = FocusNode();

  final _secretkeyCtr = TextEditingController();
  final FocusNode _secretkeyFocus = FocusNode();

  final _effectiveCtr = TextEditingController();
  final FocusNode _effectiveFocus = FocusNode();

  List<Map<String, dynamic>> coinTypeList = [];
  final _coinTypeCtr = TextEditingController();
  final FocusNode _coinTypeFocus = FocusNode();
  List<Map<String, dynamic>> tradeTypeList = [];
  final _tradeTypeCtr = TextEditingController();
  final FocusNode _tradeypeFocus = FocusNode();

  List<Map<String, dynamic>> platformTypeList = [];
  final _platformTypeCtr = TextEditingController();
  final FocusNode _platformTypeFocus = FocusNode();

  final _passphraseCtr = TextEditingController();
  final FocusNode _passphraseFocus = FocusNode();

  String tradeType = 'USDT合约';
  int tradeTypeID;
  String platformType = 'okex';
  int platformID;
  String coin = 'ETH';
  int coinID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _effectiveCtr.text = '90';
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      if (widget.editorId != null && widget.editorId.isNotEmpty) {
        Provider.of<StrategyProvider>(context, listen: false)
            .getApiModelDetail(widget.editorId);
      }

      setState(() {
        if (platformTypeList.length > 0) {
          platformTypeList.clear();
        }
        for (int i = 0;
            i <
                Provider.of<StrategyProvider>(context, listen: false)
                    .platformsList
                    .length;
            i++) {
          Map<String, dynamic> map = {
            "id": Provider.of<StrategyProvider>(context, listen: false)
                .platformsList[i]
                .id,
            "platform": Provider.of<StrategyProvider>(context, listen: false)
                .platformsList[i]
                .platform
                .toString(),
            "img": Provider.of<StrategyProvider>(context, listen: false)
                .platformsList[i]
                .img
                .toString(),
          };
          platformType = Provider.of<StrategyProvider>(context, listen: false)
              .platformsList[0]
              .platform;
          platformID = Provider.of<StrategyProvider>(context, listen: false)
              .platformsList[0]
              .id;
          platformTypeList.add(map);
        }
        if (coinTypeList.length > 0) {
          coinTypeList.clear();
        }
        for (int i = 0;
            i <
                Provider.of<StrategyProvider>(context, listen: false)
                    .coinsList
                    .length;
            i++) {
          Map<String, dynamic> map = {
            "id": Provider.of<StrategyProvider>(context, listen: false)
                .coinsList[i]
                .id,
            "coin": Provider.of<StrategyProvider>(context, listen: false)
                .coinsList[i]
                .coin
                .toString()
          };

          coin = Provider.of<StrategyProvider>(context, listen: false)
              .coinsList[0]
              .coin;
          coinID = Provider.of<StrategyProvider>(context, listen: false)
              .coinsList[0]
              .id;
          coinTypeList.add(map);
        }
        if (tradeTypeList.length > 0) {
          tradeTypeList.clear();
        }
        for (int i = 0;
            i <
                Provider.of<StrategyProvider>(context, listen: false)
                    .strategyTypeList
                    .length;
            i++) {
          Map<String, dynamic> map = {
            "id": Provider.of<StrategyProvider>(context, listen: false)
                .strategyTypeList[i]
                .id,
            "type_name": Provider.of<StrategyProvider>(context, listen: false)
                .strategyTypeList[i]
                .typeName
                .toString()
          };

          tradeType = Provider.of<StrategyProvider>(context, listen: false)
              .strategyTypeList[0]
              .typeName;
          tradeTypeID = Provider.of<StrategyProvider>(context, listen: false)
              .strategyTypeList[0]
              .id;
          tradeTypeList.add(map);
        }
      });
    });
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.getCommonAppBar(
          context,
          widget.editorId != null && widget.editorId.isNotEmpty
              ? "修改API"
              : "添加API",
          elevation: 1.0,
        ),
        backgroundColor: Colors.white,
        body: Consumer<StrategyProvider>(builder:
            (BuildContext context, StrategyProvider model, Widget child) {
          if (model.mApiModel != null) {
            _accesskeyCtr.text = model.mApiModel.accesskey ?? "";
            _secretkeyCtr.text = model.mApiModel.secretKey ?? "";
            _effectiveCtr.text = model.mApiModel.term.toString() ?? "";
          }
          return widget.type == '1'
              ? widget.editorId == null
                  ? Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          FocusWidget(
                            focusNode: _tradeypeFocus,
                            child: InputWidget(
                              maxHeight: 100,
                              textAlign: TextAlign.right,
                              focusNode: _tradeypeFocus,
                              onTab: () {
                                return showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return platformTypeWidget(
                                      typeList: platformTypeList,
                                      onTab: (id, name) {
                                        setState(() {
                                          platformType = name;
                                          platformID = id;
                                        });
                                        print(platformType);
                                        print(platformID);
                                        RouterUtil.goBack(context);
                                      },
                                    );
                                  },
                                );
                              },
                              controller: _tradeTypeCtr,
                              prefixIconConstraintsMaxWidth: 100,
                              prefixIconConstraintsMinWidth: 100,
                              prefixIconConstraintsMinHeight: 60,
                              prefixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMaxWidth: 200,
                              suffixIconConstraintsMinHeight: 60,
                              suffixIconConstraintsMinWidth: 200,
                              readOnly: true,
                              suffixIcon: Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(platformType ?? ""),
                                    SizedBox(width: width(10)),
                                    Image.asset(
                                      'images/mine/next.png',
                                      width: width(18),
                                      color: Color(0xff323232),
                                    ),
                                  ],
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Color(0xff323232), fontSize: sp(28)),
                              prefixIcon: Center(
                                child: Utils.normalText('平台'),
                              ),
                              hintText: null,
                            ),
                          ),
                          FocusWidget(
                            focusNode: _tradeypeFocus,
                            child: InputWidget(
                              maxHeight: 100,
                              textAlign: TextAlign.right,
                              focusNode: _tradeypeFocus,
                              onTab: () {
                                return showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return StrategyTypeWidget(
                                      typeList: tradeTypeList,
                                      onTab: (index, name) {
                                        print(name);
                                        setState(() {
                                          tradeType = name;
                                          tradeTypeID = index;
                                        });
                                        RouterUtil.goBack(context);
                                      },
                                    );
                                  },
                                );
                              },
                              controller: _tradeTypeCtr,
                              prefixIconConstraintsMaxWidth: 150,
                              prefixIconConstraintsMinWidth: 100,
                              prefixIconConstraintsMinHeight: 60,
                              prefixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMaxWidth: 200,
                              suffixIconConstraintsMinHeight: 60,
                              suffixIconConstraintsMinWidth: 200,
                              readOnly: true,
                              suffixIcon: Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(tradeType),
                                    SizedBox(width: width(10)),
                                    Image.asset(
                                      'images/mine/next.png',
                                      width: width(18),
                                      color: Color(0xff323232),
                                    ),
                                  ],
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Color(0xff323232), fontSize: sp(28)),
                              prefixIcon: Center(
                                child: Utils.normalText('交易类型'),
                              ),
                              hintText: null,
                            ),
                          ),
                          FocusWidget(
                            focusNode: _coinTypeFocus,
                            child: InputWidget(
                              maxHeight: 100,
                              textAlign: TextAlign.right,
                              focusNode: _coinTypeFocus,
                              onTab: () {
                                return showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return coinsTypeWidget(
                                      typeList: coinTypeList,
                                      onTab: (index, name) {
                                        print(name);
                                        setState(() {
                                          coin = name;
                                          coinID = index;
                                        });

                                        RouterUtil.goBack(context);
                                      },
                                    );
                                  },
                                );
                              },
                              controller: _coinTypeCtr,
                              prefixIconConstraintsMaxWidth: 100,
                              prefixIconConstraintsMinWidth: 100,
                              prefixIconConstraintsMinHeight: 60,
                              prefixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMaxWidth: 200,
                              suffixIconConstraintsMinHeight: 60,
                              suffixIconConstraintsMinWidth: 200,
                              readOnly: true,
                              suffixIcon: Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(coin),
                                    SizedBox(width: width(10)),
                                    Image.asset(
                                      'images/mine/next.png',
                                      width: width(18),
                                      color: Color(0xff323232),
                                    ),
                                  ],
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Color(0xff323232), fontSize: sp(28)),
                              prefixIcon: Center(
                                child: Utils.normalText('币种'),
                              ),
                              hintText: null,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: height(88),
                            color: Color(0xffF8F6F9),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width(30),
                                ),
                                Utils.normalText('API绑定')
                              ],
                            ),
                          ),
                          FocusWidget(
                            focusNode: _accesskeyFocus,
                            child: InputWidget(
                              obscureText: false,
                              textAlign: TextAlign.right,
                              controller: _accesskeyCtr,
                              focusNode: _accesskeyFocus,
                              hintText: '请输入',
                              hintStyle: TextStyle(
                                  fontSize: sp(28), color: Color(0xffcccccc)),
                              suffixIconConstraintsMaxWidth: 100,
                              suffixIconConstraintsMinWidth: 100,
                              suffixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMinHeight: 60,
                              prefixIconConstraintsMaxWidth: 200,
                              prefixIconConstraintsMinWidth: 200,
                              prefixIconConstraintsMaxHeight: 60,
                              prefixIconConstraintsMinHeight: 60,
                              maxHeight: 100,
                              suffixIcon: QrScanCode(
                                  image: 'images/mine/sys.png',
                                  callback: (value) {
                                    _accesskeyCtr.text = value;
                                  }),
                              prefixIcon: Center(
                                child: Utils.normalText('Accesskey'),
                              ),
                            ),
                          ),
                          FocusWidget(
                            focusNode: _secretkeyFocus,
                            child: InputWidget(
                              obscureText: false,
                              textAlign: TextAlign.right,
                              controller: _secretkeyCtr,
                              focusNode: _secretkeyFocus,
                              hintText: '请输入',
                              hintStyle: TextStyle(
                                  fontSize: sp(28), color: Color(0xffcccccc)),
                              suffixIconConstraintsMaxWidth: 100,
                              suffixIconConstraintsMinWidth: 100,
                              suffixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMinHeight: 60,
                              prefixIconConstraintsMaxWidth: 200,
                              prefixIconConstraintsMinWidth: 200,
                              prefixIconConstraintsMaxHeight: 60,
                              prefixIconConstraintsMinHeight: 60,
                              maxHeight: 100,
                              suffixIcon: QrScanCode(
                                  image: 'images/mine/sys.png',
                                  callback: (value) {
                                    _secretkeyCtr.text = value;
                                  }),
                              prefixIcon: Center(
                                child: Utils.normalText('Secretkey'),
                              ),
                            ),
                          ),
                          Visibility(
                            child: FocusWidget(
                              focusNode: _passphraseFocus,
                              child: InputWidget(
                                obscureText: true,
                                textAlign: TextAlign.right,
                                controller: _passphraseCtr,
                                focusNode: _passphraseFocus,
                                hintText: '请输入',
                                hintStyle: TextStyle(
                                    fontSize: sp(28), color: Color(0xffcccccc)),
                                suffixIconConstraintsMaxWidth: 100,
                                suffixIconConstraintsMinWidth: 100,
                                suffixIconConstraintsMaxHeight: 60,
                                suffixIconConstraintsMinHeight: 60,
                                prefixIconConstraintsMaxWidth: 200,
                                prefixIconConstraintsMinWidth: 200,
                                prefixIconConstraintsMaxHeight: 60,
                                prefixIconConstraintsMinHeight: 60,
                                maxHeight: 100,
                                suffixIcon: QrScanCode(
                                    image: 'images/mine/sys.png',
                                    callback: (value) {
                                      _passphraseCtr.text = value;
                                    }),
                                prefixIcon: Center(
                                  child: Utils.normalText('Passphrase'),
                                ),
                              ),
                            ),
                            visible: platformType == 'okex',
                          ),
                          FocusWidget(
                            focusNode: _effectiveFocus,
                            child: InputWidget(
                              obscureText: false,
                              textAlign: TextAlign.right,
                              controller: _effectiveCtr,
                              focusNode: _effectiveFocus,
                              hintText: '请输入',
                              hintStyle: TextStyle(
                                  fontSize: sp(28), color: Color(0xffcccccc)),
                              suffixIconConstraintsMaxWidth: 100,
                              suffixIconConstraintsMinWidth: 100,
                              suffixIconConstraintsMaxHeight: 60,
                              suffixIconConstraintsMinHeight: 60,
                              prefixIconConstraintsMaxWidth: 200,
                              prefixIconConstraintsMinWidth: 200,
                              prefixIconConstraintsMaxHeight: 60,
                              prefixIconConstraintsMinHeight: 60,
                              keyboardType: TextInputType.number,
                              maxHeight: 100,
                              suffixIcon: Center(
                                child: Utils.normalText('天'),
                              ),
                              prefixIcon: Center(
                                child: Utils.normalText('API有效期'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height(80),
                          ),
                          Container(
                            width: width(630),
                            height: height(88),
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              color: Color(0xFF7865FE), // 底色
                              borderRadius:
                                  new BorderRadius.circular(width(48)), // 圆角度
                            ),
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              radius: 0.0,
                              child: Center(
                                child: Text(
                                    widget.editorId != null &&
                                            widget.editorId.isNotEmpty
                                        ? "修改绑定"
                                        : "绑定",
                                    style: TextStyle(
                                        fontSize: sp(28),
                                        color: Color(0xffFFFFFFFF))),
                              ),
                              onTap: () {
                                if (!validInput()) {
                                  return;
                                }
                                jiaoyiBind(widget.editorId);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    FocusWidget(
                      focusNode: _coinTypeFocus,
                      child: InputWidget(
                        maxHeight: 100,
                        textAlign: TextAlign.right,
                        focusNode: _coinTypeFocus,
                        onTab: () {
                          return showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return platformTypeWidget(
                                typeList: platformTypeList,
                                onTab: (index, name) {
                                  setState(() {
                                    platformType = name;
                                    platformID = index;
                                  });
                                  print(platformType);
                                  print(platformID);
                                  RouterUtil.goBack(context);
                                },
                              );
                            },
                          );
                        },
                        controller: _coinTypeCtr,
                        prefixIconConstraintsMaxWidth: 100,
                        prefixIconConstraintsMinWidth: 100,
                        prefixIconConstraintsMinHeight: 60,
                        prefixIconConstraintsMaxHeight: 60,
                        suffixIconConstraintsMaxHeight: 60,
                        suffixIconConstraintsMaxWidth: 200,
                        suffixIconConstraintsMinHeight: 60,
                        suffixIconConstraintsMinWidth: 200,
                        readOnly: true,
                        suffixIcon: Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(platformType ?? ""),
                              SizedBox(width: width(10)),
                              Image.asset(
                                'images/mine/next.png',
                                width: width(18),
                                color: Color(0xff323232),
                              ),
                            ],
                          ),
                        ),
                        hintStyle: TextStyle(
                            color: Color(0xff323232), fontSize: sp(28)),
                        prefixIcon: Center(
                          child: Utils.normalText('平台'),
                        ),
                        hintText: null,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: height(88),
                      color: Color(0xffF8F6F9),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width(30),
                          ),
                          Utils.normalText('API绑定')
                        ],
                      ),
                    ),
                    FocusWidget(
                      focusNode: _accesskeyFocus,
                      child: InputWidget(
                        obscureText: false,
                        textAlign: TextAlign.right,
                        controller: _accesskeyCtr,
                        focusNode: _accesskeyFocus,
                        hintText: '请输入',
                        hintStyle: TextStyle(
                            fontSize: sp(28), color: Color(0xffcccccc)),
                        suffixIconConstraintsMaxWidth: 100,
                        suffixIconConstraintsMinWidth: 100,
                        suffixIconConstraintsMaxHeight: 60,
                        suffixIconConstraintsMinHeight: 60,
                        prefixIconConstraintsMaxWidth: 200,
                        prefixIconConstraintsMinWidth: 200,
                        prefixIconConstraintsMaxHeight: 60,
                        prefixIconConstraintsMinHeight: 60,
                        maxHeight: 100,
                        suffixIcon: QrScanCode(
                            image: 'images/mine/sys.png',
                            callback: (value) {
                              _accesskeyCtr.text = value;
                            }),
                        prefixIcon: Center(
                          child: Utils.normalText('Accesskey'),
                        ),
                      ),
                    ),
                    FocusWidget(
                      focusNode: _secretkeyFocus,
                      child: InputWidget(
                        obscureText: false,
                        textAlign: TextAlign.right,
                        controller: _secretkeyCtr,
                        focusNode: _secretkeyFocus,
                        hintText: '请输入',
                        hintStyle: TextStyle(
                            fontSize: sp(28), color: Color(0xffcccccc)),
                        suffixIconConstraintsMaxWidth: 100,
                        suffixIconConstraintsMinWidth: 100,
                        suffixIconConstraintsMaxHeight: 60,
                        suffixIconConstraintsMinHeight: 60,
                        prefixIconConstraintsMaxWidth: 200,
                        prefixIconConstraintsMinWidth: 200,
                        prefixIconConstraintsMaxHeight: 60,
                        prefixIconConstraintsMinHeight: 60,
                        maxHeight: 100,
                        suffixIcon: QrScanCode(
                            image: 'images/mine/sys.png',
                            callback: (value) {
                              _secretkeyCtr.text = value;
                            }),
                        prefixIcon: Center(
                          child: Utils.normalText('Secretkey'),
                        ),
                      ),
                    ),
                    Visibility(
                      child: FocusWidget(
                        focusNode: _passphraseFocus,
                        child: InputWidget(
                          obscureText: true,
                          textAlign: TextAlign.right,
                          controller: _passphraseCtr,
                          focusNode: _passphraseFocus,
                          hintText: '请输入',
                          hintStyle: TextStyle(
                              fontSize: sp(28), color: Color(0xffcccccc)),
                          suffixIconConstraintsMaxWidth: 100,
                          suffixIconConstraintsMinWidth: 100,
                          suffixIconConstraintsMaxHeight: 60,
                          suffixIconConstraintsMinHeight: 60,
                          prefixIconConstraintsMaxWidth: 200,
                          prefixIconConstraintsMinWidth: 200,
                          prefixIconConstraintsMaxHeight: 60,
                          prefixIconConstraintsMinHeight: 60,
                          maxHeight: 100,
                          suffixIcon: QrScanCode(
                              image: 'images/mine/sys.png',
                              callback: (value) {
                                _passphraseCtr.text = value;
                              }),
                          prefixIcon: Center(
                            child: Utils.normalText('Passphrase'),
                          ),
                        ),
                      ),
                      visible: platformType == 'okex',
                    ),
                    FocusWidget(
                      focusNode: _effectiveFocus,
                      child: InputWidget(
                        obscureText: false,
                        textAlign: TextAlign.right,
                        controller: _effectiveCtr,
                        focusNode: _effectiveFocus,
                        hintText: '请输入',
                        hintStyle: TextStyle(
                            fontSize: sp(28), color: Color(0xffcccccc)),
                        suffixIconConstraintsMaxWidth: 100,
                        suffixIconConstraintsMinWidth: 100,
                        suffixIconConstraintsMaxHeight: 60,
                        suffixIconConstraintsMinHeight: 60,
                        prefixIconConstraintsMaxWidth: 200,
                        prefixIconConstraintsMinWidth: 200,
                        prefixIconConstraintsMaxHeight: 60,
                        prefixIconConstraintsMinHeight: 60,
                        keyboardType: TextInputType.number,
                        maxHeight: 100,
                        suffixIcon: Center(
                          child: Utils.normalText('天'),
                        ),
                        prefixIcon: Center(
                          child: Utils.normalText('API有效期'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(80),
                    ),
                    Container(
                      width: width(630),
                      height: height(88),
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        color: Color(0xFF7865FE), // 底色
                        borderRadius:
                            new BorderRadius.circular(width(48)), // 圆角度
                      ),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        radius: 0.0,
                        child: Center(
                          child: Text(
                              widget.editorId != null &&
                                      widget.editorId.isNotEmpty
                                  ? "修改绑定"
                                  : "绑定",
                              style: TextStyle(
                                  fontSize: sp(28),
                                  color: Color(0xffFFFFFFFF))),
                        ),
                        onTap: () {
                          if (!validInput()) {
                            return;
                          }
                          gensuiBind(widget.editorId);
                        },
                      ),
                    ),
                  ],
                ));
        }));
  }

  bool validInput() {
    if (_accesskeyCtr.text == null || _accesskeyCtr.text == "") {
      Toast.showText('accesskey不能为空');
      return false;
    }
    if (_secretkeyCtr.text == null || _secretkeyCtr.text == "") {
      Toast.showText('accesskey不能为空');
      return false;
    }

    if (platformType == 'okex') {
      if (_passphraseCtr.text == null || _passphraseCtr.text == "") {
        Toast.showText('Passphrase不能为空');
        return false;
      }
    }

    return true;
  }

  jiaoyiBind(type) async {
    Toast.showLoading('loading...');

    if (type == null || type.toString().isEmpty) {
      Map data = {
        "platform": platformID,
        "accesskey": _accesskeyCtr.text,
        "secretKey": _secretkeyCtr.text,
        "type": 1,
        "term": _effectiveCtr.text,
        "passphrase": _passphraseCtr.text,
        "trans_type": tradeTypeID,
        "coin": coin,
      };
      await StrategyServer.getCreateApi(data);
      Toast.showText("账户审核中");
    } else {
      Map data = {
        "platform": platformID,
        "accesskey": _accesskeyCtr.text,
        "secretKey": _secretkeyCtr.text,
        "type": 1,
        "term": _effectiveCtr.text,
        "passphrase": _passphraseCtr.text,
        "trans_type": tradeTypeID,
        "id": widget.editorId,
      };
      await StrategyServer.getUpdateApi(data);
      Toast.showText("修改账户审核中");
    }

    Provider.of<StrategyProvider>(context, listen: false).getStrategyAccount();
    RouterUtil.goBack(context);
    // RouterUtil.push(context, Routes.home, clearStack: true, replace: true);
  }

  gensuiBind(type) async {
    Toast.showLoading('loading...');
    print("platformID:" + platformID.toString());
    print("accesskey:" + _accesskeyCtr.text.toString());
    print("secretKey:" + _secretkeyCtr.text.toString());
    print("type:" + "2");
    print("term:" + _effectiveCtr.text.toString());
    print("_passphraseCtr:" + _passphraseCtr.text.toString());
    print("_effectiveCtr:" + _effectiveCtr.text.toString());
    print("id:" + widget.editorId.toString());

    if (type == null || type.toString().isEmpty) {
      Map data = {
        "platform": platformID,
        "accesskey": _accesskeyCtr.text,
        "secretKey": _secretkeyCtr.text,
        "type": 2,
        "term": _effectiveCtr.text,
        "passphrase": _passphraseCtr.text,
      };
      await StrategyServer.getCreateApi(data);
      Toast.showText("绑定账户成功");
    } else {
      Map data = {
        "platform": platformID,
        "accesskey": _accesskeyCtr.text,
        "secretKey": _secretkeyCtr.text,
        "type": 2,
        "term": _effectiveCtr.text,
        "passphrase": _passphraseCtr.text,
        "id": widget.editorId,
      };
      await StrategyServer.getUpdateApi(data);
      Toast.showText("修改账户成功");
    }

    Provider.of<StrategyProvider>(context, listen: false).getStrategyAccount();
    RouterUtil.goBack(context);
    // RouterUtil.push(context, Routes.home, clearStack: true, replace: true);
  }
}

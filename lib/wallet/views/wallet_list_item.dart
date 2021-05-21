import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/constants/index.dart';
import 'package:flutter_tianji/routes/fluro_navigator.dart';
import 'package:flutter_tianji/utils/screen.dart';
import 'package:flutter_tianji/wallet/provider/index.dart';
import 'package:flutter_tianji/wallet/routes/index.dart';
import 'package:provider/provider.dart';

class WalletListItem extends StatelessWidget {
  final String image;
  final String Currency;
  final String cny;
  final String amount;
  final WallerProvider model;
  const WalletListItem({
    Key key,
    @required this.image,
    @required this.Currency,
    @required this.cny,
    @required this.amount,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styleBig = TextStyle(
      color: kTextColor3,
    );
    TextStyle styleSm = TextStyle(fontSize: sp(20), color: kBlack);
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Provider.of<WallerProvider>(context, listen: false)
              .setCurrentCoin(Currency ?? "");
          RouterUtil.push(
              context, "${WalletRouter.recordBibi2}?coinName=${Currency ?? ""}&id=${model.currentCoin.coinId}");
        },
        child: Container(
          height: height(220),
          padding: EdgeInsets.only(left: width(30), right: width(30)),
          margin: EdgeInsets.only(top: height(30)),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius:
              new BorderRadius.circular(
                  width(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                          image == "" ? 'images/home/icon_quantify.png' : image,
                          width: 40,
                          height: 40),
                      SizedBox(
                        width: height(20),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${Currency ?? ""}',
                              style: TextStyle(
                                  fontSize: sp(32),
                                  color: Color(0xFF604F6A),)),
                          Text('${model.isOpen ? amount ?? "0.00" : "****"}',
                              style: TextStyle(
                                  fontSize: sp(36), color: Color(0xFF444444),
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  )),
                  Text('≈ ¥${model.isOpen ? cny ?? "0.00" : "****"}',
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xffCFCFCF))),
                ],
              ),
              SizedBox(
                height: height(30),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Color(0xff58d8d8d8)))),
              ),
              SizedBox(
                height: height(20),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: GestureDetector(
                    child: Text('充币',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: sp(28), color: kPrimaryColor)),
                    onTap: () => RouterUtil.push(context,
                        "${WalletRouter.recharge}?coinName=${Currency ?? ""}"),
                  )),
                  Container(
                    width: width(1),
                    height: height(30),
                    color: Color(0xff58d8d8d8),
                  ),
                  Expanded(
                      child: GestureDetector(
                          child: Text('提币',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: sp(28), color: kPrimaryColor)),
                          onTap: () {
                            RouterUtil.pushResult(context,
                                "${WalletRouter.withdrawDetail}?coinName=${Currency ?? ""}",
                                (result) {
                              Provider.of<WallerProvider>(context,
                                      listen: false)
                                  .setCurrentCoin(Currency ?? "");
                            });
                          }))
                ],
              )
            ],
          ),
        ));
  }
}

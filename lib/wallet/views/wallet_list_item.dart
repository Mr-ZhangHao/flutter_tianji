import 'package:flutter/gestures.dart';
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
  final double cny;
  final double amount;
  const WalletListItem({
    Key key,
    @required this.image,
    @required this.Currency,
    @required this.cny,
    @required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styleBig =
    TextStyle(color: kTextColor3,);
    TextStyle styleSm = TextStyle(fontSize: sp(20), color: kBlack);
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
      Provider.of<WallerProvider>(context, listen: false).setCurrentCoin(Currency ??"");
      RouterUtil.push(context, "${WalletRouter.item}?coinName=${Currency ??""}");
    },
    child: Container(
        height: height(220),
        color: Color(0xFFFFFFFF),
        padding:EdgeInsets.only(left: width(20),right:  width(20) ) ,
        margin: EdgeInsets.only(top: height(10) ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(image==""?'images/home/icon_quantify.png':image,
                        width: width(80), height: height(80)),
                    SizedBox(width: height(20),),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${Currency ??""}', style: TextStyle(fontSize: sp(32), color: Color(0xFF604F6A), fontWeight: FontWeight.bold)),
                        Text('${amount ??"0.00"}', style: TextStyle(fontSize: sp(36), color: Color(0xFF444444))),

                      ],
                    )
                  ],
                )
                ),
                Text('≈ ¥${cny ??"0.00"}', style: TextStyle(fontSize: sp(28), color: Color(0xffCFCFCF))),
              ],
            ),
            SizedBox(height: height(30),),
            Container( decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5, color: kDividerColor))),),
            SizedBox(height: height(20),),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Expanded(
                child: GestureDetector(child:  Text('充币', textAlign: TextAlign.center,style: TextStyle(fontSize: sp(28), color: kPrimaryColor)),
                  onTap: () => RouterUtil.push(context, "${WalletRouter.recharge}?coinName=${Currency ??""}"),
                )

            ),
              Container(
                width: width(1),
                height: height(30),
                color: Color(0xffE8E8E8),
              ),
              Expanded(
                child:GestureDetector(child:    Text('提币',textAlign: TextAlign.center, style: TextStyle(fontSize: sp(28), color:kPrimaryColor)),
                onTap: () {
                  RouterUtil.pushResult(context, "${WalletRouter.withdrawDetail}?coinName=${Currency ??""}",
                          (result) {
                        Provider.of<WallerProvider>(context, listen: false).setCurrentCoin(Currency ??"");
                      });
                }
                )
              )
            ],
          )
          ],
        ),
    ));
  }
}

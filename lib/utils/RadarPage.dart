import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/RadarView.dart';
import 'package:flutter_tianji/utils/util.dart';

class RadarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0F1532),
        body: Stack(
          children: [
            Positioned.fill(
              left: 10,
              right: 10,
              child: Center(
                child: Stack(children: [
                  Positioned.fill(
                    child: RadarView(),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        child: Utils.normalText('text'),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            /*      image: DecorationImage(
                                image: AssetImage('assets/images/logo.png')), */
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(.5),
                                blurRadius: 5.0,
                                spreadRadius: 3.0,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}

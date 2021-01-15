import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tianji/utils/RadarPainter.dart';

class RadarView extends StatefulWidget {
  @override
  _RadarViewState createState() => _RadarViewState();
}

class _RadarViewState extends State<RadarView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: .0, end: pi * 2).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: RadarPainter(_animation.value),
        );
      },
    );
  }
}

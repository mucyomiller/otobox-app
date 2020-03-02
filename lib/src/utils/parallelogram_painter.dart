import 'package:flutter/material.dart';

class ParallelogramPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ParallelogramPainter({@required this.shadow, @required this.clipper});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var path = clipper.getClip(size).shift(Offset(0, 0));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';

class ParallelogramClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.90, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.10, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

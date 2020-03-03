import 'package:flutter/material.dart';
import 'package:otobox/src/utils/clip_right_clipper.dart';
import 'package:otobox/src/utils/parallelogram_clipper.dart';
import 'package:otobox/src/utils/parallelogram_painter.dart';

class CustomInput extends StatelessWidget {
  final Icon icon;
  final Widget input;

  CustomInput({@required this.icon, @required this.input});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParallelogramPainter(
          shadow:
              Shadow(blurRadius: 5, color: Colors.grey, offset: Offset(0, 0)),
          clipper: ParallelogramClipper()),
      child: ClipPath(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 45,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipPath(
                child: Container(
                  height: double.infinity,
                  width: 105,
                  color: Color(0xFF103E5F),
                  child: this.icon,
                ),
                clipper: ClipRightClipper(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: this.input,
                ),
              ),
            ],
          ),
        ),
        clipBehavior: Clip.antiAlias,
        clipper: ParallelogramClipper(),
      ),
    );
  }
}

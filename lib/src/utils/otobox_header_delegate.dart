import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OtoboxHeaderDelegate extends SliverPersistentHeaderDelegate {
  OtoboxHeaderDelegate({this.maxExtent, this.minExtent});

  double maxExtent;
  double minExtent;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/prime.png',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {},
            ),
          ),
        ),
        Positioned(
          right: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

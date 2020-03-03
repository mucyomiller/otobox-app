import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;

  HomeCard({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Text(title),
      ),
    );
  }
}

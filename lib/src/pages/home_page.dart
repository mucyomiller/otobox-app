import 'package:flutter/material.dart';
import 'package:otobox/src/utils/otobox_header_delegate.dart';

import 'package:provider/provider.dart';
import 'package:otobox/src/store/navigator_bloc.dart';
import 'package:otobox/src/utils/size_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigatorBloc screen = Provider.of<NavigatorBloc>(context);
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Color(0xFFEEF4F3),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: OtoboxHeaderDelegate(
                minExtent: 150.0,
                maxExtent: 250.0,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Text('Fred'),
                  childCount: 10),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                IconData(0xe92a, fontFamily: 'otobox'),
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                IconData(0xe933, fontFamily: 'otobox'),
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                IconData(0xe92f, fontFamily: 'otobox'),
                size: 36,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                IconData(0xe932, fontFamily: 'otobox'),
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                IconData(0xe930, fontFamily: 'otobox'),
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

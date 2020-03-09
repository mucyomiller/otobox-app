import 'package:flutter/material.dart';
import 'package:otobox/src/services/api_interface_service.dart';
import 'package:otobox/src/utils/otobox_header_delegate.dart';
import 'package:otobox/src/widgets/otobox_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
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
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return OtoboxCard(post: snapshot.data[index]);
                    }, childCount: snapshot.data.length),
                  )
                ],
              ),
            );
          } else {
            return Container(
              color: Color(0xFFEEF4F3),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

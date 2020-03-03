
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otobox/src/models/post.dart';

class PlaceCard extends StatefulWidget {
  PlaceCard({Key key, this.post}) : super(key: key);

  final Post post;

  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    var _dsize = MediaQuery.of(context).size.shortestSide;
    return Container(
        height: _dsize * 0.9,
        child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(children: <Widget>[
          Image.network('https://placeimg.com/640/480/tech',fit: BoxFit.cover),
          Positioned.directional(
              bottom: 0,
              end: 0,
              start: 0,
              textDirection: TextDirection.ltr,
              height: _dsize * 0.4,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text('Marriot Hotel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
                      Text(widget.post.content),
                      Row(
                        children: <Widget>[
                          FlatButton.icon(
                              icon: Icon(Icons.location_on), //`Icon` to display
                              label: Text('Nyarugenge'), //`Text` to display
                              onPressed: () {},
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.visibility), //`Icon` to display
                              label: Text('300'), //`Text` to display
                              onPressed: () {},
                            ),
                        ],
                      ), 

                    ]),
                  )))
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.all(10),
        borderOnForeground: true,
      ),
    );
  }
}

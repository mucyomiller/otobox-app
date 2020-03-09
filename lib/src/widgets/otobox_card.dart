import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otobox/src/models/post.dart';
import 'package:otobox/src/utils/clip_left_clipper.dart';

class OtoboxCard extends StatefulWidget {
  OtoboxCard({Key key, this.post}) : super(key: key);

  final Post post;

  _OtoboxCardState createState() => _OtoboxCardState();
}

class _OtoboxCardState extends State<OtoboxCard> {
  @override
  Widget build(BuildContext context) {
    var _dsize = MediaQuery.of(context).size.shortestSide;
    return Container(
      height: _dsize * 0.9,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Image.network('https://placeimg.com/640/480/tech',
                  fit: BoxFit.cover),
              Positioned.directional(
                  top: 0,
                  start: 40,
                  textDirection: TextDirection.ltr,
                  width: 40,
                  height: 50,
                  child: Container(
                      color: Colors.white,
                      child: Image.network(widget.post.logo))),
              Positioned.directional(
                  bottom: 0,
                  end: 0,
                  textDirection: TextDirection.ltr,
                  width: _dsize * 0.7,
                  height: 25,
                  child: ClipPath(
                    clipper: ClipLeftClipper(),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                        color: widget.post.type == "RENT"
                            ? Color(0xFFE4C580)
                            : Color(0xFF787B7D),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                widget.post.type,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              ClipPath(
                                clipper: ClipLeftClipper(),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  height: double.infinity,
                                  width: _dsize * 0.45,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      widget.post.price,
                                      style: TextStyle(
                                          color: widget.post.type == "RENT"
                                              ? Color(0xFFE4C580)
                                              : Color(0xFF787B7D)),
                                    ),
                                  ),
                                ),
                              )
                            ])),
                  ))
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    widget.post.modelName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF787B7D),
                    ),
                  ),
                  Text(
                    widget.post.year,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF787B7D),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.all(10),
        borderOnForeground: true,
      ),
    );
  }
}

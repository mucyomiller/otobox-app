import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:otobox/src/services/connectivity_status.dart';
import 'package:otobox/src/utils/size_config.dart';

class LoadingWidget extends StatefulWidget {
  final type;
  LoadingWidget({Key key, this.type}) : super(key: key);
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    double yourHeight = height * 0.65 / 100;
    int cardNumber = yourHeight.floor() - 1;
    if (connectionStatus == ConnectivityStatus.Offline) {
      return noConnection();
    }

    if (widget.type == "Agenda") {
      return agendaShimmer(cardNumber);
    }

    if (widget.type == "Speaker") {
      return speakerShimmer(cardNumber);
    }

    if (widget.type == "Profile") {
      return profileShimmer(cardNumber);
    }

    return defaultShimmer(cardNumber);
  }

  Widget agendaShimmer(cardNumber) {
    return Container(
        color: Color(0xFFEEF4F3),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: _enabled,
                  child: Column(
                    children: List(cardNumber)
                        .map((_) => Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                      ),
                                      Container(
                                        width: 60.0,
                                        height: 10.0,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 80.0,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 80.0,
                                        height: 4.0,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        width: 80.0,
                                        height: 18.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ])
            ],
          ))
        ]));
  }

  Widget speakerShimmer(cardNumber) {
    return Container(
        color: Color(0xFFEEF4F3),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: _enabled,
                  child: Column(
                    children: List(cardNumber * 3)
                        .map((_) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    child: Container(
                                      width: 80.0,
                                      height: 80.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0),
                                        ),
                                        Container(
                                          width: 80.0,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ])
            ],
          ))
        ]));
  }

  Widget profileShimmer(cardNumber) {
    return Container(
        color: Color(0xFFEEF4F3),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: _enabled,
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          Container(
                            width: 60.0,
                            height: 10.0,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          Container(
                            width: double.infinity,
                            height: 100.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    ],
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: _enabled,
                  child: Column(
                    children: List(cardNumber)
                        .map((_) => Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                      ),
                                      Container(
                                        width: 60.0,
                                        height: 10.0,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 80.0,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 80.0,
                                        height: 4.0,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        width: 80.0,
                                        height: 18.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ])
            ],
          ))
        ]));
  }

  Widget noConnection() {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.exclamation,
            size: SizeConfig.safeBlockVertical * 5,
            color: Color(0xFF18ACA1),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 5,
          ),
          Text('Check your internet connection'),
        ],
      )),
    );
  }

  Widget defaultShimmer(cardNumber) {
    return Container(
      color: Color(0xFFEEF4F3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitDoubleBounce(
            color: Color(0xFF18ACA1),
            size: 50.0,
          ),
        ],
      ),
    );
  }
}

////          Expanded(
////            child: Container(),
////          ),
////          Padding(
////            padding: const EdgeInsets.symmetric(vertical: 8.0),
////            child: FlatButton(
////                onPressed: () {
////                  setState(() {
////                    _enabled = !_enabled;
////                  });
////                },
////                child: Text(
////                  _enabled ? 'Stop' : 'Play',
////                  style: Theme.of(context).textTheme.button.copyWith(
////                      fontSize: 18.0,
////                      color: _enabled ? Colors.redAccent : Colors.green),
////                )),
////          )
//        ],
//      ),
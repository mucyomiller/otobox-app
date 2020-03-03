import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:otobox/src/services/connectivity_status.dart';
import 'package:otobox/src/services/fcm_notification.dart';
import 'package:otobox/src/database/db_helper.dart';
import 'package:otobox/src/models/user_model.dart';
import 'package:otobox/src/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:otobox/src/utils/size_config.dart';

class MainScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  MainScreen({this.analytics, this.observer});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var height = 0.0;
  List<Widget> pages;
  bool goToComplete = true;
  DbHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    new FcmNotification().setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: HomePage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBar(connectionStatus),
    );
  }

  bottomAppBar(connectionStatus) {
    if (connectionStatus == ConnectivityStatus.Offline)
      return BottomAppBar(
        elevation: 0,
        color: Color(0xFF18ACA1),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: SizeConfig.safeBlockVertical * 3,
          child: Row(children: <Widget>[
            Spacer(),
            Text(
              'No internet connection',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
          ]),
        ),
      );
  }

  Future<bool> checkIncompleteUser() async {
    UserModel userModel = await dbHelper.getUser();
    if (userModel.country != '' || userModel.country != null) {
      return true;
    } else {
      return false;
    }
  }
}

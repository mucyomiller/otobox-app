import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:otobox/src/services/api_interface_service.dart';
import 'package:otobox/src/database/db_helper.dart';
import 'package:otobox/src/models/user_model.dart';

class FcmNotification {
  FirebaseMessaging _firebaseMessaging;

  void setUpFirebase() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessagingListeners();
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token) async {
      DbHelper dbHelper = new DbHelper();
      UserModel user = await dbHelper.getUser();
      // send token to server;
      var response = await updateUserProfileField(
          fieldName: "token", data: token, userId: user.id);
      if (response == token) {
        if (kDebugMode) print('fcm token sent to server successful -> $token');
      }
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        if (kDebugMode) print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        if (kDebugMode) print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        if (kDebugMode) print('on launch $message');
      },
    );

    // subscribe to default channel
    _firebaseMessaging.subscribeToTopic('otobox');
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      if (kDebugMode) print("Settings registered: $settings");
    });
  }
}

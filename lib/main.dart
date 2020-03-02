import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    runApp(App(prefs: prefs));
  });
}

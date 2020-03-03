import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:otobox/src/pages/login_page.dart';
import 'package:otobox/src/pages/profile_page.dart';
import 'package:otobox/src/reactivemodel/ReactiveProfile.dart';
import 'package:otobox/src/screens/onboarding_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:otobox/src/services/connectivity_service.dart';
import 'package:otobox/src/services/connectivity_status.dart';
import 'package:otobox/src/store/navigator_bloc.dart';
import 'screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final SharedPreferences prefs;
  static FirebaseAnalytics analytics = new FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      new FirebaseAnalyticsObserver(analytics: analytics);
  App({this.prefs});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color(0xFFEEF4F3),
        statusBarBrightness: Brightness.light));
    return StreamProvider<ConnectivityStatus>(
        builder: (context) =>
            ConnectivityService().connectionStatusController.stream,
        child: MultiProvider(
          providers: [
            Provider<NavigatorBloc>.value(
              value: NavigatorBloc(),
            ),
            ChangeNotifierProvider<ReactiveProfile>.value(
              value: ReactiveProfile(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: <String, WidgetBuilder>{
              '/mainscreen': (BuildContext context) => MainScreen(),
              '/profilepage': (BuildContext context) => ProfilePage(),
            },
            title: 'Otobox',
            theme: ThemeData(
              primaryColor: Color(0xFF103E5F),
            ),
            home: _handleCurrentScreen(),
            navigatorObservers: <NavigatorObserver>[observer],
          ),
        ));
  }

  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    bool loggedIn = (prefs.getBool('loggedIn') ?? false);
    if (seen) {
      if (loggedIn) {
        return MainScreen(analytics: analytics, observer: observer);
      }
      return LoginPage(prefs: prefs);
    }
    return OnboardingScreen(prefs: prefs);
  }
}

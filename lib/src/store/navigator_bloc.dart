import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:otobox/src/models/user_model.dart';

class NavigatorBloc {
  String _currentRoute = 'mainscreen';
  dynamic _routeState;

  String get currentRoute => _currentRoute;

  dynamic navigateTo(
      {BuildContext context,
      String routename,
      dynamic routestate,
      bool strict = true}) {
    _currentRoute = ModalRoute.of(context).settings.name?.replaceAll('/', '');
    _routeState = ModalRoute.of(context).settings.arguments;
    if (kDebugMode) print('we used navigator navigateTo');
    if (routename == _currentRoute &&
        isSameState(routestate, _routeState) &&
        strict == true) {
      if (kDebugMode) print('experimental see route -> $_currentRoute');
      if (kDebugMode)
        print(
            'experimental see system route -> ${ModalRoute.of(context).settings.name}');
      if (kDebugMode) print('the same route return!');
      return null;
    }
    if (routename == _currentRoute) {
      if (kDebugMode) print('same routes defferent states!');
      if (kDebugMode) print('state -> ${routestate.toString()}');
      return {
        Navigator.of(context).pushNamedAndRemoveUntil(
            "/$routename",
            (route) => route.isCurrent
                ? route.settings.name == "/$routename" ? false : true
                : true,
            arguments: routestate),
      };
    }
    if (kDebugMode) print('different routes!');
    if (kDebugMode) print('state -> ${routestate.toString()}');
    return {
      Navigator.of(context).pushNamed("/$routename", arguments: routestate),
    };
  }

  void pop(BuildContext context) {
     Navigator.pop(context);
  }

  void resetState() {
    _currentRoute = null;
    _routeState = null;
  }

  bool isSameState(dynamic first, dynamic last) {
    if ((first is UserModel && last is UserModel)) {
      return first == last;
    }
    return false;
  }
}

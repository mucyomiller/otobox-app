import 'package:flutter/widgets.dart';

class NavigationState with ChangeNotifier {
  dynamic _parameter;

  dynamic get parameter => _parameter;

  set parameter(dynamic val) {
    _parameter = val;
    notifyListeners();
  }

  changeNavigationState(dynamic i) {
    parameter = i;
  }
}

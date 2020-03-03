import 'package:flutter/widgets.dart';

class LoadingBloc with ChangeNotifier {
  bool _initial = true;
  bool get initial => _initial;

  set initial(bool val) {
    _initial = val;
    notifyListeners();
  }

  changeLoading(bool i) {
    initial = i;
  }

  getLoading() {
    return _initial;
  }
}

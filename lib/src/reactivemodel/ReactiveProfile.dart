import 'package:flutter/foundation.dart';
import 'package:otobox/src/models/user_model.dart';
import 'package:otobox/src/repository/repository.dart';

class ReactiveProfile extends ChangeNotifier {
  Repository repo = new Repository();
  UserModel _mine;

  Future<UserModel> profile() async {
    if (_mine != null) {
      if (kDebugMode) print('returned cached profile');
      return _mine;
    }
    if (kDebugMode) print('returned API profile');
    // ask repository to give us profile
    UserModel profile = await repo.getRepoProfile();
    // caching newly added attendees
    _mine = profile;
    return _mine;
  }

  set updateProfile(UserModel value) {
    // I will comeback here!
    notifyListeners();
  }

  void updatedProfile() {
    _mine = null;
    notifyListeners();
  }
}

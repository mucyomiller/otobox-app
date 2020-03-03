import 'package:otobox/src/models/user_model.dart';
import 'package:otobox/src/services/api_interface_service.dart';

class Repository {
  Future<UserModel> getRepoProfile() async {
    // before doing HTTP calls checks if we already have it locally
    UserModel profile = await getCurrentUser();
    return profile;
  }
}

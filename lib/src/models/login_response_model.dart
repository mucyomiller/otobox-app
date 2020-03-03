import 'package:otobox/src/models/user_model.dart';

class LoginResponseModel {
  bool status;
  int code;
  String message;
}

class LoginResponseDataModel {
  String token;
  UserModel userModel;

  LoginResponseDataModel({this.token, this.userModel});
}

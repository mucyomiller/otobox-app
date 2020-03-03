import 'package:otobox/src/models/user_model.dart';

class VerifyResponseModel {
  final bool status;
  final int code;
  final String message;
  final UserModel data;

  VerifyResponseModel({this.status, this.code, this.message, this.data});

  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyResponseModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: UserModel.fromJson(
        json['data'],
      ),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'code': code, 'message': message, 'data': data};
}

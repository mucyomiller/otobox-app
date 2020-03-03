class VerifyModel {
  final int code;
  final String email;

  VerifyModel({this.code, this.email});

  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return VerifyModel(
      code: json['code'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'email': email,
      };
}

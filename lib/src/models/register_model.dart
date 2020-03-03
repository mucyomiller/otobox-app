class RegisterModel {
  final String fullname;
  final String email;
  final String secret;
  final String token;

  RegisterModel({this.fullname, this.email, this.secret, this.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      fullname: json['fullname'],
      email: json['email'],
      secret: json['secret'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'fullname': fullname, 'email': email, 'secret': secret, 'token': token};
}

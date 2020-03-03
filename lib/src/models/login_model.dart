class LoginModel {
  final String email;
  final String secret;

  LoginModel({this.email, this.secret});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      secret: json['secret'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'secret': secret,
      };
}

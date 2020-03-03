class RegisterResponseModel {
  bool status;
  int code;
  String message;
  RegisterResponseDataModel registerResponseDataModel;

  RegisterResponseModel({
    this.status,
    this.code,
    this.message,
    this.registerResponseDataModel,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      registerResponseDataModel: RegisterResponseDataModel.fromJson(
        json['data'],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'data': registerResponseDataModel,
      };
}

class RegisterResponseDataModel {
  String token;
  RegisterResponseDataDataModel registerResponseDataDataModel;

  RegisterResponseDataModel({
    this.token,
    this.registerResponseDataDataModel,
  });

  factory RegisterResponseDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDataModel(
      token: json['token'],
      registerResponseDataDataModel: RegisterResponseDataDataModel.fromJson(
        json['data'],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'data': registerResponseDataDataModel,
      };
}

class RegisterResponseDataDataModel {
  String role;
  String status;
  String privacy;
  String id;
  String fullName;
  String email;
  String createdAt;
  String updateAt;
  RegisterResponseDataDataModel(
      {this.role,
      this.status,
      this.privacy,
      this.id,
      this.fullName,
      this.email,
      this.createdAt,
      this.updateAt});
  factory RegisterResponseDataDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDataDataModel(
      role: json['role'],
      status: json['status'],
      privacy: json['privacy'],
      id: json['_id'],
      fullName: json['fullname'],
      email: json['email'],
      createdAt: json['created_at'],
      updateAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'role': status,
        'status': status,
        'privacy': privacy,
        '_id': id,
        'fullname': fullName,
        'email': email,
        'created_at': createdAt,
        'updated_at': updateAt,
      };
}

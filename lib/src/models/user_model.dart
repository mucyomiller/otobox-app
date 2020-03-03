class UserModel {
  final String id;
  final String fullname;
  final String email;
  final String description;
  final String avatar;
  final String role;
  final String status;
  final String privacy;
  final String education;
  final String country;
  final String phone;

  UserModel(
      {this.id,
      this.fullname,
      this.email,
      this.description,
      this.avatar,
      this.role,
      this.status,
      this.privacy,
      this.education,
      this.country,
      this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullname: json['fullname'],
      email: json['email'],
      description: json['description'],
      avatar: json['avatar'],
      role: json['role'],
      status: json['status'],
      privacy: json['privacy'],
      education: json['education'],
      country: json['country'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fullname': fullname,
        'email': email,
        'description': description,
        'avatar': avatar,
        'role': role,
        'status': status,
        'privacy': privacy,
        'education': education,
        'country': country,
        'phone': phone,
      };

  Map<String, dynamic> toMap() => {
        'id': id,
        'fullname': fullname,
        'email': email,
        'description': description,
        'avatar': avatar,
        'role': role,
        'status': status,
        'privacy': privacy,
        'education': education,
        'country': country,
        'phone': phone,
      };

  static UserModel fromMap(Map map) {
    return UserModel(
      id: map['id'],
      fullname: map['fullname'],
      email: map['email'],
      description: map['description'],
      avatar: map['avatar'],
      role: map['role'],
      status: map['status'],
      privacy: map['privacy'],
      education: map['education'],
      country: map['country'],
      phone: map['phone'],
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.id == id &&
        o.fullname == fullname &&
        o.email == email &&
        o.description == description &&
        o.avatar == avatar &&
        o.role == role &&
        o.status == status &&
        o.privacy == privacy &&
        o.education == education &&
        o.country == country &&
        o.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullname.hashCode ^
        email.hashCode ^
        description.hashCode ^
        avatar.hashCode ^
        role.hashCode ^
        status.hashCode ^
        privacy.hashCode ^
        education.hashCode ^
        country.hashCode ^
        phone.hashCode;
  }

  @override
  String toString() {
    return 'UserModel id: $id, fullname: $fullname, email: $email, description: $description, avatar: $avatar, role: $role, status: $status, privacy: $privacy, education: $education, country: $country, phone: $phone';
  }
}

class UserData {
  final String token;
  final UserModel user;
  UserData({this.token, this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        token: json['token'], user: UserModel.fromJson(json['user']));
  }

  Map<String, dynamic> toJson() => {'token': token, 'user': user.toJson()};
}

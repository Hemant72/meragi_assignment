import 'dart:convert';

import 'package:meragi_assignment/src/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.email,
    required super.uid,
    required super.password,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, password: $password,)';
  }
}

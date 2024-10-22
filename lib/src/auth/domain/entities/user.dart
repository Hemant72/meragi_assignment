import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String? password;

  const User({
    required this.uid,
    required this.email,
    this.password,
  });

  @override
  List<Object?> get props => [uid, email, password];
}

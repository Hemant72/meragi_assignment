import 'package:meragi_assignment/core/utils/typedef.dart';
import 'package:meragi_assignment/src/auth/domain/entities/user.dart';

abstract class AuthRepositiory {
  const AuthRepositiory();

  ResultFuture<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  ResultFuture<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}

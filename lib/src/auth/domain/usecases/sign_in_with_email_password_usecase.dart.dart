import 'package:equatable/equatable.dart';
import 'package:meragi_assignment/core/usecase/usecase.dart';
import 'package:meragi_assignment/core/utils/typedef.dart';
import 'package:meragi_assignment/src/auth/domain/entities/user.dart';
import 'package:meragi_assignment/src/auth/domain/repository/auth_repositiory.dart';

class SignInWithEmailPassword
    extends UsecaseWithParams<User, UserParams> {
  final AuthRepositiory _authRepositiory;

  SignInWithEmailPassword(this._authRepositiory);

  ResultVoid signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _authRepositiory.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  ResultFuture<User> call(UserParams params) async {
    return _authRepositiory.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserParams extends Equatable {
  final String email;
  final String password;

  const UserParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

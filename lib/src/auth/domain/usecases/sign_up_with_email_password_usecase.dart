import 'package:equatable/equatable.dart';
import 'package:meragi_assignment/core/usecase/usecase.dart';
import 'package:meragi_assignment/core/utils/typedef.dart';
import 'package:meragi_assignment/src/auth/domain/entities/user.dart';
import 'package:meragi_assignment/src/auth/domain/repository/auth_repositiory.dart';

class SignUpWithEmailPassword
    extends UsecaseWithParams<User, CreateUserParams> {
  final AuthRepositiory _authRepositiory;

  SignUpWithEmailPassword(this._authRepositiory);

  ResultVoid signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _authRepositiory.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  ResultFuture<User> call(CreateUserParams params) async {
    return _authRepositiory.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class CreateUserParams extends Equatable {
  final String email;
  final String password;

  const CreateUserParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

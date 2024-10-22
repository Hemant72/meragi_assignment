import 'package:fpdart/fpdart.dart';
import 'package:meragi_assignment/core/error/exception.dart';
import 'package:meragi_assignment/core/error/failure.dart';
import 'package:meragi_assignment/core/utils/typedef.dart';
import 'package:meragi_assignment/src/auth/data/datasource/auth_remote_datasource.dart';
import 'package:meragi_assignment/src/auth/domain/entities/user.dart';
import 'package:meragi_assignment/src/auth/domain/repository/auth_repositiory.dart';

class AuthRepositioryImpl implements AuthRepositiory {
  final AuthRemoteDataSource _authRemoteDataSource;
  const AuthRepositioryImpl(this._authRemoteDataSource);

  @override
  ResultFuture<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRemoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  ResultFuture<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRemoteDataSource.signUpWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }
}

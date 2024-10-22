import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:meragi_assignment/core/error/exception.dart';
import 'package:meragi_assignment/src/auth/domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<User> signUpWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final firebase.FirebaseAuth firebaseAuth;

  AuthRemoteDatasourceImpl(this.firebaseAuth);

  @override
  Future<User> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;

      return user != null
          ? User(
              uid: user.uid,
              email: user.email.toString(),
            )
          : throw const ServerException(
              message: 'User not found', statusCode: 404);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<User> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;

      return user != null
          ? User(
              uid: user.uid,
              email: user.email.toString(),
            )
          : throw const ServerException(
              message: 'User not found', statusCode: 404);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
}

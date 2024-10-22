import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meragi_assignment/src/auth/data/datasource/auth_remote_datasource.dart';
import 'package:meragi_assignment/src/auth/data/repositiory/auth_repositiory_impl.dart';
import 'package:meragi_assignment/src/auth/domain/repository/auth_repositiory.dart';
import 'package:meragi_assignment/src/auth/domain/usecases/sign_in_with_email_password_usecase.dart.dart';
import 'package:meragi_assignment/src/auth/domain/usecases/sign_up_with_email_password_usecase.dart';
import 'package:meragi_assignment/src/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Firebase Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Repository
  sl.registerLazySingleton<AuthRepositiory>(() => AuthRepositioryImpl(sl()));

  // DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDatasourceImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => SignInWithEmailPassword(sl()));
  sl.registerLazySingleton(
      () => SignUpWithEmailPassword(sl())); // <-- Register the new use case

  // BLoC
  sl.registerFactory(() =>
      AuthBloc(signInWithEmailPassword: sl(), signUpWithEmailPassword: sl()));
}

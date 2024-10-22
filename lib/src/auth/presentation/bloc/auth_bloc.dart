import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi_assignment/src/auth/domain/entities/user.dart';
import 'package:meragi_assignment/src/auth/domain/usecases/sign_in_with_email_password_usecase.dart.dart';
import 'package:meragi_assignment/src/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailPassword _signInWithEmailPassword;
  final SignUpWithEmailPassword _signUpWithEmailPassword;

  AuthBloc({
    required SignInWithEmailPassword signInWithEmailPassword,
    required SignUpWithEmailPassword signUpWithEmailPassword,
  })  : _signInWithEmailPassword = signInWithEmailPassword,
        _signUpWithEmailPassword = signUpWithEmailPassword,
        super(AuthInitial()) {
    on<AuthWithEmail>(_signInHandler);
    on<AuthSingUpWithEmail>(_signUpHandler);
  }

  _signInHandler(AuthWithEmail event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final result = await _signInWithEmailPassword(
      UserParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((l) {
      emit(AuthFailure(l.message));
    }, (r) {
      emit(AuthSuccess(r));
    });
  }

  _signUpHandler(AuthSingUpWithEmail event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final result = await _signUpWithEmailPassword(
      CreateUserParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((l) {
      emit(AuthFailure(l.message));
    }, (r) {
      emit(AuthSignUpSuccess(r));
    });
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    log(transition.toString());
  }
}

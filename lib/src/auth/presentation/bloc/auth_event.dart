part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthWithEmail extends AuthEvent {
  final String email;
  final String password;

  const AuthWithEmail({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthSingUpWithEmail extends AuthEvent {
  final String email;
  final String password;

  const AuthSingUpWithEmail({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthRegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String passwordConfirm;

  const AuthRegisterEvent({
    required this.username,
    required this.password,
    required this.passwordConfirm,
  });
  @override
  List<Object?> get props => [username, password, passwordConfirm];
}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  const AuthLoginEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class AuthResetStateEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
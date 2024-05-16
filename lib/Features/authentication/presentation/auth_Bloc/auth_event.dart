part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class LogInEvent extends AuthEvent
{
  final String email;
  final String password;

  const LogInEvent({required this.email , required this.password,});

  @override
  List<Object?> get props => [email, password];
}

class SignUpEvent extends AuthEvent
{
  final String email;
  final String password;

  const SignUpEvent({required this.email , required this.password,});
  @override
  List<Object?> get props => [email, password];
}

class ResetPasswordEvent extends AuthEvent
{
  final String id;

  const ResetPasswordEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteEvent extends AuthEvent
{
  final String id;

  const DeleteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetInfoEvent extends AuthEvent
{
  final String id;

  const GetInfoEvent ({required this.id});

  @override
  List<Object?> get props => [id];
}
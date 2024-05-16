part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class LogInState extends AuthState
{
  @override
  List<Object> get props => [];
}

final class SignUpState extends AuthState
{
  @override
  List<Object> get props => [];
}

final class ResetPasswordSTate extends AuthState
{
  @override
  List<Object> get props => [];
}

final class DeleteUserSTate extends AuthState
{
  @override
  List<Object> get props => [];
}

final class GetInfoState extends AuthState
{
  @override
  List<Object> get props => [];
}

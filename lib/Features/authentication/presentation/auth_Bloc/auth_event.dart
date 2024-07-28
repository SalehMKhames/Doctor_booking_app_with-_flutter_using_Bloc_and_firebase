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
  final String newPassword;

  const ResetPasswordEvent({required this.id, required this.newPassword});

  @override
  List<Object?> get props => [id, newPassword];
}

class DeleteEvent extends AuthEvent
{
  final String id;

  const DeleteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserUploadEvent extends AuthEvent
{
  final String name;
  final String email;
  final String birth;
  final String phone;
  final String medicalStatus;


  const UserUploadEvent(
      {
        required this.name,
        required this.email,
        required this.birth,
        required this.phone,
        required this.medicalStatus
      }
  );

  @override
  List<Object?> get props => [name, email, birth, phone, medicalStatus];
}
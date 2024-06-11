part of 'auth_bloc.dart';

enum UserAuthStatus {init, loading, success, failed}

class AuthState extends Equatable
{
  final UserCredentials? credentials;
  final UserAuthStatus userLogIn;
  final UserAuthStatus userRegister;
  final UserAuthStatus userResetPassword;
  final UserAuthStatus userDelete;
  final UserAuthStatus userGetinfo;
  final String? message;

  const AuthState(
  {
    this.credentials,

    this.userLogIn = UserAuthStatus.init,
    this.userRegister= UserAuthStatus.init,
    this.userResetPassword= UserAuthStatus.init,
    this.userDelete= UserAuthStatus.init,
    this.userGetinfo= UserAuthStatus.init,
    this.message
  });

  AuthState copyWith({
    UserCredentials? cred,
    UserAuthStatus? userLogIn,
    UserAuthStatus? userRegister,
    UserAuthStatus? userResetPassword,
    UserAuthStatus? userDelete,
    UserAuthStatus? userGetinfo,
    String? message
  })
  {
    return AuthState
    (
      credentials: cred ?? credentials,
      userLogIn: userLogIn ?? this.userLogIn,
      userRegister: userRegister ?? this.userRegister,
      userResetPassword:  userResetPassword ?? this.userResetPassword,
      userDelete: userDelete ?? this.userDelete,
      userGetinfo: userGetinfo ?? this.userGetinfo,
      message: message ?? this.message
    );
  }

  @override
  List<Object?> get props =>
      [credentials, userLogIn, userRegister, userDelete, userResetPassword, userGetinfo,];

}
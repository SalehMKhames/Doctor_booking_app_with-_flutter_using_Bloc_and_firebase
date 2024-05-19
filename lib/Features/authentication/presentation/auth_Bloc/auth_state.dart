part of 'auth_bloc.dart';

enum UserAuthStatus {init, loading, success, failed}

class AuthState extends Equatable
{
  final User? user;
  final UserCredentials? credentials;
  final UserAuthStatus userLogIn;
  final UserAuthStatus userRegister;
  final UserAuthStatus userResetPassword;
  final UserAuthStatus userDelete;
  final UserAuthStatus userGetinfo;


  const AuthState(
  {
    this.user,
    this.credentials,

    this.userLogIn = UserAuthStatus.init,
    this.userRegister= UserAuthStatus.init,
    this.userResetPassword= UserAuthStatus.init,
    this.userDelete= UserAuthStatus.init,
    this.userGetinfo= UserAuthStatus.init
  });

  AuthState copyWith({
    User? user,
    UserCredentials? cred,
    UserAuthStatus? userLogIn,
    UserAuthStatus? userRegister,
    UserAuthStatus? userResetPassword,
    UserAuthStatus? userDelete,
    UserAuthStatus? userGetinfo,
  })
  {
    return AuthState
    (
      user: user ?? this.user,
      credentials: cred ?? credentials,
      userLogIn: userLogIn ?? this.userLogIn,
      userRegister: userRegister ?? this.userRegister,
      userResetPassword:  userResetPassword ?? this.userResetPassword,
      userDelete: userDelete ?? this.userDelete,
      userGetinfo: userGetinfo ?? this.userGetinfo
    );
  }

  @override
  List<Object?> get props => [credentials, userLogIn, userRegister, userDelete, userResetPassword, userGetinfo];

}
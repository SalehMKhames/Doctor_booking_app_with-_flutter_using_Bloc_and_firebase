part of 'auth_bloc.dart';

enum UserAuthStatus {init, loading, success, failed}

class AuthState extends Equatable
{
  final UserCredentials? credentials;
  final UserAuthStatus userLogIn;
  final UserAuthStatus userRegister;
  final UserAuthStatus userResetPassword;
  final UserAuthStatus userDelete;
  final UserAuthStatus userUploadInfo;
  final UserAuthStatus doctorUploadInfo;
  final UserAuthStatus userSignOut;
  final String? message;

  const AuthState(
  {
    this.credentials,
    this.userLogIn = UserAuthStatus.init,
    this.userRegister= UserAuthStatus.init,
    this.userResetPassword= UserAuthStatus.init,
    this.userDelete= UserAuthStatus.init,
    this.userUploadInfo = UserAuthStatus.init,
    this.doctorUploadInfo = UserAuthStatus.init,
    this.userSignOut = UserAuthStatus.init,
    this.message
  });

  AuthState copyWith({
    UserCredentials? cred,
    UserAuthStatus? userLogIn,
    UserAuthStatus? userRegister,
    UserAuthStatus? userResetPassword,
    UserAuthStatus? userDelete,
    UserAuthStatus? userUploadInfo,
    UserAuthStatus? doctorUploadInfo,
    UserAuthStatus? userSignOut,
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
      userUploadInfo: userUploadInfo ?? this.userUploadInfo,
      doctorUploadInfo: doctorUploadInfo ?? this.doctorUploadInfo,
      userSignOut: userSignOut ?? this.userSignOut,
      message: message ?? this.message
    );
  }

  @override
  List<Object?> get props =>
      [credentials, userLogIn, userRegister, userDelete, userResetPassword, userUploadInfo, doctorUploadInfo, userSignOut];

}
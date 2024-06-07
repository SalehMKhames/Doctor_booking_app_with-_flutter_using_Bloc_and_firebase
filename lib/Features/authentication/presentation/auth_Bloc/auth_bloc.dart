import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/utils/Strings.dart';
import 'package:equatable/equatable.dart';

import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/userRegister_usecase.dart';
import '../../domain/usecases/userLogin_usecase.dart';
import '../../domain/usecases/resetPassword_usecase.dart';
import '../../domain/usecases/userDelete_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState>
{
  final User user;
  final UserCredentials userCredential;
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final DeleteUsecase deleteUsecase;

  AuthBloc(
      this.user,
      this.userCredential,
      this.registerUsecase,
      this.loginUsecase,
      this.resetPasswordUsecase,
      this.deleteUsecase,
      ) : super(const AuthState())
  {
    on<LogInEvent>(_login);
    on<SignUpEvent>(_signup);
    on<DeleteEvent>(_delete);
    on<ResetPasswordEvent>(_resetpassword);
  }


  FutureOr<void> _signup(SignUpEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userRegister: UserAuthStatus.loading));
    final result = await registerUsecase.execute(userCredential);
    
    result.fold(
      (fail) => emit(state.copyWith(userRegister: UserAuthStatus.failed, /*message: RegisterSuccess*/)),
      (credentials) => emit(state.copyWith(cred: credentials, userRegister: UserAuthStatus.success)),
    );
  }

  FutureOr<void> _login(LogInEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userLogIn: UserAuthStatus.loading));
    final result = await loginUsecase.execute(userCredential);

    result.fold
    (
      (fail) => emit(state.copyWith(userLogIn: UserAuthStatus.failed)),
      (credentials) => emit(state.copyWith(cred: credentials, userLogIn: UserAuthStatus.success)),
    );
  }

  FutureOr<void> _delete(DeleteEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userDelete: UserAuthStatus.loading));
    final result = await deleteUsecase.execute(user);

    result.fold
    (
       (fail) => emit(state.copyWith(userDelete: UserAuthStatus.failed)),
       (succ) => emit(state.copyWith(userDelete: UserAuthStatus.success))
    );
  }

  FutureOr<void> _resetpassword(ResetPasswordEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userResetPassword: UserAuthStatus.loading));
    final result = await resetPasswordUsecase.execute(userCredential);

    result.fold
    (
      (fail) => emit(state.copyWith(userResetPassword: UserAuthStatus.failed)),
      (succ) => emit(state.copyWith(userResetPassword: UserAuthStatus.success))
    );
  }

}

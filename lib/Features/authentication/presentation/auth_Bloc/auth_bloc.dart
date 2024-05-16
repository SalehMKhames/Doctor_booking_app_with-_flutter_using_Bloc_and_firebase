import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/userRegister_usecase.dart';
import '../../domain/usecases/userLogin_usecase.dart';
import '../../domain/usecases/resetPassword_usecase.dart';
import '../../domain/usecases/userDelete_usecase.dart';
import '../../domain/usecases/userGetInfo_usercase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
{
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final DeleteUsecase deleteUsecase;
  final UserGetInfo userGetInfo;

  AuthBloc(super.initialState,
      {
        required this.loginUsecase,
        required this.registerUsecase,
        required this.resetPasswordUsecase,
        required this.deleteUsecase,
        required this.userGetInfo
      }
  );

  AuthBloc() : super(AuthInitial())
  {
    on<AuthEvent>((event, emit)
    {
      if (event is )
    });//on AuthEvent
  }
}

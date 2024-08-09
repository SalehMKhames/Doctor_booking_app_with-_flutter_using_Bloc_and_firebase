import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:doctory/core/utils/src/doctor_category.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'package:doctory/core/utils/Strings.dart';

import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';

import '../../domain/usecases/userRegister_usecase.dart';
import '../../domain/usecases/userLogin_usecase.dart';
import '../../domain/usecases/resetPassword_usecase.dart';
import '../../domain/usecases/userDelete_usecase.dart';
import '../../domain/usecases/UploadUserdata.dart';
import '../../domain/usecases/DoctorUploadData_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState>
{
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final DeleteUsecase deleteUsecase;
  final Uploaduserdata uploadData;
  final DoctoruploaddataUsecase doctorUsecase;

  AuthBloc(
      this.registerUsecase,
      this.loginUsecase,
      this.resetPasswordUsecase,
      this.deleteUsecase,
      this.uploadData,
      this.doctorUsecase
      ) : super(const AuthState())
  {
    on<LogInEvent>(_login);
    on<SignUpEvent>(_signup);
    on<DeleteEvent>(_delete);
    on<ResetPasswordEvent>(_resetpassword);
    on<UserUploadEvent>(_uploadData);
    on<DoctorUploadEvent>(_uploadDoctorData);
  }


  FutureOr<void> _signup(SignUpEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userRegister: UserAuthStatus.loading));
    final result = await registerUsecase.execute(event.email, event.password);
    
    result.fold(
      (fail) => emit(state.copyWith(userRegister: UserAuthStatus.failed, message: failure)),
      (credentials) => emit(state.copyWith(cred: credentials, userRegister: UserAuthStatus.success, message: RegisterSuccess)),
    );
  }

  FutureOr<void> _login(LogInEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userLogIn: UserAuthStatus.loading));
    final result = await loginUsecase.execute(event.email, event.password);

    result.fold
    (
      (fail) => emit(state.copyWith(userLogIn: UserAuthStatus.failed, message: failure)),
      (credentials) => emit(state.copyWith(cred: credentials, userLogIn: UserAuthStatus.success, message: LogInSuccess)),
    );
  }

  FutureOr<void> _delete(DeleteEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userDelete: UserAuthStatus.loading));
    final result = await deleteUsecase.execute(event.id);

    result.fold
    (
       (fail) => emit(state.copyWith(userDelete: UserAuthStatus.failed, message: failure)),
       (succ) => emit(state.copyWith(userDelete: UserAuthStatus.success, message: DeleteUserSuccess))
    );
  }

  FutureOr<void> _resetpassword(ResetPasswordEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userResetPassword: UserAuthStatus.loading));
    final result = await resetPasswordUsecase.execute(event.id, event.newPassword);

    result.fold
    (
      (fail) => emit(state.copyWith(userResetPassword: UserAuthStatus.failed, message: failure)),
      (succ) => emit(state.copyWith(userResetPassword: UserAuthStatus.success, message: ResetPasswordSuccess))
    );
  }

  FutureOr<void> _uploadData(UserUploadEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(userUploadInfo: UserAuthStatus.loading));
    final result = await uploadData.execute(
      event.dbName,
      event.name,
      event.email,
      event.birth,
      event.phone,
      event.medicalStatus
    );

    result.fold
    (
      (fail) => emit(state.copyWith(userUploadInfo: UserAuthStatus.failed, message: failure)),
      (succ) => emit(state.copyWith(userUploadInfo: UserAuthStatus.success, message: uploadSuccess))
    );
  }

  FutureOr<void> _uploadDoctorData(DoctorUploadEvent event, Emitter<AuthState> emit) async
  {
    emit(state.copyWith(doctorUploadInfo: UserAuthStatus.loading));
    final result = await doctorUsecase.execute(event.dbName, event.name, event.bio, event.profileImage, event.category, event.address);

    result.fold
    (
      (fail) => emit(state.copyWith(doctorUploadInfo: UserAuthStatus.failed, message: failure)),
      (succ) => emit(state.copyWith(doctorUploadInfo: UserAuthStatus.success, message: uploadSuccess))
    );
  }
}

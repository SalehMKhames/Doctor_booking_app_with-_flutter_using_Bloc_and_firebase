import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctory/core/utils/Strings.dart';
import 'package:equatable/equatable.dart';

import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';
import '../../user/domain/usecases/GetUserData.dart';
import '../../user/domain/usecases/EditUserData.dart';
import '../../user/domain/usecases/DeleteUserData_Usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

@Injectable()
class UserBloc extends Bloc<UserEvent, UserState>
{
  final GetuserdataUsecase getuserdata;
  final EdituserdataUsecase edituserdata;
  final DeleteuserdataUsecase deleteuserdata;

  UserBloc(
      this.getuserdata,
      this.edituserdata,
      this.deleteuserdata
  ) : super(const UserState())
  {
    on<GetUserEvent>(_getUser);
    on<EditUserEvent>(_editUser);
    on<DeleteUserEvent>(_deleteUser);
  }

  FutureOr<void> _getUser(GetUserEvent event, Emitter<UserState> emit) async
  {
    emit(state.copyWith(getUserState: UserDataStatus.loading));
    final result = await getuserdata.execute(event.id);

    result.fold(
      (fail) => emit(state.copyWith(getUserState: UserDataStatus.failed, message: failure)),
      (data) => emit(state.copyWith(data: data, getUserState: UserDataStatus.success)),
    );
  }

  FutureOr<void> _editUser(EditUserEvent event, Emitter<UserState> emit) async
  {
    emit(state.copyWith(editUserData: UserDataStatus.loading));
    final result = await edituserdata.execute(event.id, event.field, event.value);

    result.fold(
          (fail) => emit(state.copyWith(getUserState: UserDataStatus.failed, message: failure)),
          (success) => emit(state.copyWith(getUserState: UserDataStatus.success, message: "Your profile has been updated.")),
    );
  }

  FutureOr<void> _deleteUser(DeleteUserEvent event, Emitter<UserState> emit) async
  {
    emit(state.copyWith(deleteUserData: UserDataStatus.loading));
    final result = await deleteuserdata.execute(event.id);

    result.fold(
          (fail) => emit(state.copyWith(deleteUserData: UserDataStatus.failed, message: failure)),
          (success) => emit(state.copyWith(deleteUserData: UserDataStatus.success, message: "Your profile has been deleted.")),
    );
  }
}

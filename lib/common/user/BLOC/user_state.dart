part of 'user_bloc.dart';

enum UserDataStatus {init, loading, success, failed}

class UserState extends Equatable
{
  final User? data;
  final String? message;
  final UserDataStatus getUserState;
  final UserDataStatus editUserData;
  final UserDataStatus deleteUserData;

  const UserState({
    this.data,
    this.message,
    this.getUserState = UserDataStatus.init,
    this.editUserData = UserDataStatus.init,
    this.deleteUserData = UserDataStatus.init,
  });

  UserState copyWith({
    User? data,
    String? message,
    UserDataStatus? getUserState,
    UserDataStatus? editUserData,
    UserDataStatus? deleteUserData
  })
  {
    return UserState(
        data: data ?? this.data,
        message: message ?? this.message,
        getUserState: getUserState ?? this.getUserState,
        editUserData: editUserData ?? this.editUserData,
        deleteUserData: deleteUserData ?? this.deleteUserData
    );
  }

  @override
  List<Object?> get props => [data, message, getUserState, editUserData, deleteUserData];
}

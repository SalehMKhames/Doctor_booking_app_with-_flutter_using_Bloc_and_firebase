part of 'user_bloc.dart';

sealed class UserEvent extends Equatable
{
  const UserEvent();
}

class GetUserEvent extends UserEvent
{
  final String id;

  const GetUserEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteUserEvent extends UserEvent
{
  final String id;

  const DeleteUserEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class EditUserEvent extends UserEvent
{
  final String id;
  final String field;
  final String value;

  const EditUserEvent({required this.id, required this.field, required this.value});

  @override
  List<Object?> get props => [id, field, value];
}

part of 'appointment_bloc.dart';

sealed class AppointmentEvent extends Equatable {
  const AppointmentEvent();
}

class CreateEvent extends AppointmentEvent {
  final UuidV4 doctorId;
  final UuidV4 userId;
  final TimeOfDay hour;
  final DateTime day;
  Acceptance initAcceptance = Acceptance.wait;

  CreateEvent(
    {
      required this.doctorId,
      required this.userId,
      required this.hour,
      required this.day,
      required this.initAcceptance
  });

  @override
  List<Object?> get props => [doctorId, userId, hour, day, initAcceptance];
}

class EditAppointEvent extends AppointmentEvent
{
  final UuidV4 id;
  final String field;
  final String newValue;

  const EditAppointEvent({required this.id, required this.field, required this.newValue});

  @override
  List<Object?> get props => throw [id, field, newValue];
}

class DeleteAppointEvent extends AppointmentEvent
{
  final UuidV4 id;

  const DeleteAppointEvent({required this.id,});

  @override
  List<Object?> get props => throw [id];
}

class AcceptingEvent extends AppointmentEvent
{
  final UuidV4 id;
  final Acceptance isAccepted;

  const AcceptingEvent({required this.id, required this.isAccepted});

  @override
  List<Object?> get props => [id, isAccepted];

}

class GetAllAppointmentsEvent extends AppointmentEvent {
  final UuidV4 id;
  final String userId;

  const GetAllAppointmentsEvent({required this.id, required this.userId});

  @override
  List<Object?> get props => [id, userId];

}

class GetUserAppointmentsEvent extends AppointmentEvent {
  final UuidV4 id;

  const GetUserAppointmentsEvent({required this.id});

  @override
  List<Object?> get props => [id];

}

class FilterEvent extends AppointmentEvent {
  final Acceptance value;

  const FilterEvent({required this.value});

  @override
  List<Object?> get props => [value];

}

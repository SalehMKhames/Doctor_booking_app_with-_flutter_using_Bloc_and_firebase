part of 'appointment_bloc.dart';

enum AppointmentStatus { init, loading, success, failure}

class AppointmentState extends Equatable
{
  final Acceptance? accept;
  final String? message;
  final AppointmentStatus? appointmentAcceptedStatus;
  final AppointmentStatus? appointmentWaitingStatus;
  final AppointmentStatus? appointmentRefusedStatus;
  final AppointmentStatus? createAppointmentStatus;
  final AppointmentStatus? editAppointmentStatus;
  final AppointmentStatus? deleteAppointmentStatus;

  const AppointmentState({
    this.accept,
    this.message,
    this.appointmentAcceptedStatus = AppointmentStatus.init,
    this.appointmentWaitingStatus = AppointmentStatus.init,
    this.appointmentRefusedStatus = AppointmentStatus.init,
    this.createAppointmentStatus = AppointmentStatus.init,
    this.editAppointmentStatus = AppointmentStatus.init,
    this.deleteAppointmentStatus = AppointmentStatus.init,
  });

  AppointmentState copyWith({
    Acceptance? accept,
    String? message,
    AppointmentStatus? appointmentAcceptedStatus,
    AppointmentStatus? appointmentWaitingStatus,
    AppointmentStatus? appointmentRefusedStatus,
    AppointmentStatus? createAppointmentStatus,
    AppointmentStatus? editAppointmentStatus,
    AppointmentStatus? deleteAppointmentStatus
  })
  {
    return AppointmentState(
        accept: accept ?? this.accept,
        message: message ?? this.message,
        appointmentAcceptedStatus:
            appointmentAcceptedStatus ?? this.appointmentAcceptedStatus,
        appointmentWaitingStatus:
            appointmentWaitingStatus ?? this.appointmentWaitingStatus,
        appointmentRefusedStatus:
            appointmentRefusedStatus ?? this.appointmentRefusedStatus,
        deleteAppointmentStatus:
            deleteAppointmentStatus ?? this.deleteAppointmentStatus,
        createAppointmentStatus:
            createAppointmentStatus ?? this.createAppointmentStatus,
        editAppointmentStatus:
            editAppointmentStatus ?? this.editAppointmentStatus);
  }

  @override
  List<Object?> get props => [
        accept,
        message,
        appointmentAcceptedStatus,
        appointmentWaitingStatus,
        appointmentRefusedStatus,
        createAppointmentStatus,
        editAppointmentStatus,
        deleteAppointmentStatus
      ];
}

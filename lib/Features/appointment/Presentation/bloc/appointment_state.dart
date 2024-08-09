part of 'appointment_bloc.dart';

enum AppointmentStatus { init, loading, success, failure }

class AppointmentState extends Equatable {
  final Appointment? appointment;
  final List<Appointment>? appoints;
  final Acceptance? accept;
  final String? message;
  final AppointmentStatus? appointmentAcceptedStatus;
  final AppointmentStatus? appointmentWaitingStatus;
  final AppointmentStatus? appointmentRefusedStatus;
  final AppointmentStatus? createAppointmentStatus;
  final AppointmentStatus? editAppointmentStatus;
  final AppointmentStatus? deleteAppointmentStatus;
  final AppointmentStatus? getAllAppointmentsStatus;
  final AppointmentStatus? getAppointmentStatus;
  final AppointmentStatus? filterAppointmentsStatus;

  const AppointmentState(
      {this.appointment,
      this.appoints,
      this.accept,
      this.message,
      this.appointmentAcceptedStatus = AppointmentStatus.init,
      this.appointmentWaitingStatus = AppointmentStatus.init,
      this.appointmentRefusedStatus = AppointmentStatus.init,
      this.createAppointmentStatus = AppointmentStatus.init,
      this.editAppointmentStatus = AppointmentStatus.init,
      this.deleteAppointmentStatus = AppointmentStatus.init,
      this.getAllAppointmentsStatus = AppointmentStatus.init,
      this.getAppointmentStatus = AppointmentStatus.init,
      this.filterAppointmentsStatus = AppointmentStatus.init});

  AppointmentState copyWith({
    Appointment? appointment,
    List<Appointment>? appoints,
    Acceptance? accept,
    String? message,
    AppointmentStatus? appointmentAcceptedStatus,
    AppointmentStatus? createAppointmentStatus,
    AppointmentStatus? editAppointmentStatus,
    AppointmentStatus? deleteAppointmentStatus,
    AppointmentStatus? getAllAppointmentsStatus,
    AppointmentStatus? getAppointmentStatus,
    AppointmentStatus? filterAppointmentsStatus,
  }) {
    return AppointmentState(
        appointment: appointment ?? this.appointment,
        appoints: appoints ?? this.appoints,
        accept: accept ?? this.accept,
        message: message ?? this.message,
        appointmentAcceptedStatus:
            appointmentAcceptedStatus ?? this.appointmentAcceptedStatus,
        deleteAppointmentStatus:
            deleteAppointmentStatus ?? this.deleteAppointmentStatus,
        createAppointmentStatus:
            createAppointmentStatus ?? this.createAppointmentStatus,
        editAppointmentStatus:
            editAppointmentStatus ?? this.editAppointmentStatus,
        getAllAppointmentsStatus:
            getAllAppointmentsStatus ?? this.getAllAppointmentsStatus,
        getAppointmentStatus:
            getAllAppointmentsStatus ?? this.getAllAppointmentsStatus,
        filterAppointmentsStatus:
            filterAppointmentsStatus ?? this.filterAppointmentsStatus);
  }

  @override
  List<Object?> get props => [
    appointment,
    appoints,
    accept,
    message,
    appointmentAcceptedStatus,
    createAppointmentStatus,
    editAppointmentStatus,
    deleteAppointmentStatus,
    getAllAppointmentsStatus,
    getAppointmentStatus,
    filterAppointmentsStatus
  ];
}

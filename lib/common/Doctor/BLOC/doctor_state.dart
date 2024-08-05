part of 'doctor_bloc.dart';

enum DoctorStatus{init, loading, success, failed}

class DoctorState extends Equatable
{
  final Doctor? doctor;
  final String? message;
  final DoctorStatus getDoctorState;
  final DoctorStatus getAllDoctorsState;
  final DoctorStatus getDoctorByNameState;

  const DoctorState({
    this.doctor,
    this.message,
    this.getDoctorState = DoctorStatus.init,
    this.getAllDoctorsState = DoctorStatus.init,
    this.getDoctorByNameState = DoctorStatus.init
  });

  DoctorState copyWith({
    Doctor? doctor,
    List<Doctor>? allDoctors = const [],
    String? message,
    DoctorStatus? getDoctorState,
    DoctorStatus? getAllDoctorsState,
    DoctorStatus? getDoctorByNameState
  })
  {
    return DoctorState(
      doctor: doctor ?? this.doctor,
      message: message ?? this.message,
      getDoctorState: getDoctorState ?? this.getDoctorState,
      getAllDoctorsState: getAllDoctorsState ?? this.getAllDoctorsState,
      getDoctorByNameState: getDoctorByNameState ?? this.getDoctorByNameState
    );
  }

  @override
  List<Object?> get props => [doctor, message, getDoctorState, getAllDoctorsState, getDoctorByNameState];
}
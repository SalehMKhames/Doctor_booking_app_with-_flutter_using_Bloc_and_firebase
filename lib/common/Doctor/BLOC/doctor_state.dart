part of 'doctor_bloc.dart';

enum DoctorStatus{init, loading, success, failed}

class DoctorState extends Equatable
{
  final Doctor? doctor;
  final List<Doctor>? allDoctors;
  final String? message;
  final DoctorStatus getDoctorState;
  final DoctorStatus getAllDoctorsState;
  final DoctorStatus getDoctorByNameState;
  final DoctorStatus getDoctorsBySpecialState;

  const DoctorState({
    this.doctor,
    this.allDoctors,
    this.message,
    this.getDoctorState = DoctorStatus.init,
    this.getAllDoctorsState = DoctorStatus.init,
    this.getDoctorByNameState = DoctorStatus.init,
    this.getDoctorsBySpecialState = DoctorStatus.init
  });

  DoctorState copyWith({
    Doctor? doctor,
    List<Doctor>? allDoctors = const [],
    String? message,
    DoctorStatus? getDoctorState,
    DoctorStatus? getAllDoctorsState,
    DoctorStatus? getDoctorByNameState,
    DoctorStatus? getDoctorsBySpecialState,
  })
  {
    return DoctorState(
      doctor: doctor ?? this.doctor,
      message: message ?? this.message,
      getDoctorState: getDoctorState ?? this.getDoctorState,
      getAllDoctorsState: getAllDoctorsState ?? this.getAllDoctorsState,
      getDoctorByNameState: getDoctorByNameState ?? this.getDoctorByNameState,
      getDoctorsBySpecialState: getDoctorsBySpecialState ?? this.getDoctorsBySpecialState
    );
  }

  @override
  List<Object?> get props => [doctor, allDoctors, message, getDoctorState, getAllDoctorsState, getDoctorByNameState, getDoctorsBySpecialState];
}
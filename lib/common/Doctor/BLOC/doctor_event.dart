part of 'doctor_bloc.dart';

sealed class DoctorEvent extends Equatable
{
  const DoctorEvent();
}

class GetDoctorEvent extends DoctorEvent
{
  final String id;

  const GetDoctorEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetAllDoctorsEvent extends DoctorEvent
{
  const GetAllDoctorsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetDoctorByNameEvent extends DoctorEvent
{
  final String name;

  const GetDoctorByNameEvent({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

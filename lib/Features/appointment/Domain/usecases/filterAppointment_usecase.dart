import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FilterappointmentUsecase
{
  final AppointmentRepo appointmentRepo;

  FilterappointmentUsecase({required this.appointmentRepo});

  Future<Either<Failure, List<Appointment>>> execute(String value) async
  => await appointmentRepo.filterAppointmentsByAcceptance(value);
}
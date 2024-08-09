import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@LazySingleton()
class GetappointmentUsecase
{
  AppointmentRepo appointmentRepo;

  GetappointmentUsecase({required this.appointmentRepo});

  Future<Either<Failure, Appointment>> execute(UuidV4 id) async => await appointmentRepo.getUserAppointment(id);
}
import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@LazySingleton()
class GetAllappointmentsUsecase
{
  AppointmentRepo appointmentRepo;

  GetAllappointmentsUsecase({required this.appointmentRepo});

  Future<Either<Failure, List<Appointment>>> execute(UuidV4 id, String userId) async => await appointmentRepo.getAllAppointments(id, userId);
}
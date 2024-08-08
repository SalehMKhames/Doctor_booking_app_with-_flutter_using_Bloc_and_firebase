import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@LazySingleton()
class AcceptingappointmentUsecase
{
  final AppointmentRepo appointmentRepo;

  AcceptingappointmentUsecase({required this.appointmentRepo});

  Future<Either<Failure, Unit>> execute(UuidV4 id, Acceptance newAccept) async => await appointmentRepo.acceptingAppointment(id, newAccept);
}
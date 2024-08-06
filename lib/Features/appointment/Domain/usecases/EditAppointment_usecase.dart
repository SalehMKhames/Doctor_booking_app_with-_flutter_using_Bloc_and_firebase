import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';


@LazySingleton()
class EditappointmentUsecase
{
  AppointmentRepo appointmentRepo;

  EditappointmentUsecase({required this.appointmentRepo});

  Future<Either<Failure, Unit>> execute(UuidV4 id, String field, String value) async
    => await appointmentRepo.editAppointment(id, field, value);
}
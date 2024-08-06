import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:flutter/src/material/time.dart';
import 'package:uuid/v4.dart';

class AppointmentRepoImpl extends AppointmentRepo
{
  @override
  Future<Either<Failure, Unit>> createAppointment(UuidV4 id, String doctorId, String userId, TimeOfDay hour, String day) {
    // TODO: implement createAppointment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteAppointment(UuidV4 id) {
    // TODO: implement deleteAppointment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> editAppointment(UuidV4 id, String field, String value) {
    // TODO: implement editAppointment
    throw UnimplementedError();
  }
  
}
import 'package:dartz/dartz.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

abstract class AppointmentRepo
{
  Future<Either<Failure, Unit>> createAppointment(UuidV4 id, String doctorId, String userId, TimeOfDay hour, String day);

  Future<Either<Failure, Unit>> editAppointment(UuidV4 id, String field, String value);

  Future<Either<Failure, Unit>> deleteAppointment(UuidV4 id);
}
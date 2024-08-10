import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@LazySingleton()
class CreateappointmentUsecase
{
  final AppointmentRepo appointmentRepo;

  CreateappointmentUsecase({required this.appointmentRepo});

  Future<Either<Failure, Unit>> execute(UuidV4 doctorId, UuidV4 userId, TimeOfDay hour, DateTime day) async
      => await appointmentRepo.createAppointment(doctorId, userId, hour, day);
}
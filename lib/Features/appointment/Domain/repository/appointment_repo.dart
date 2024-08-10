import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

abstract class AppointmentRepo
{
  Future<Either<Failure, List<Appointment>>> getAllAppointments(UuidV4 id, String userId);

  Future<Either<Failure, Appointment>> getUserAppointment(UuidV4 id);

  Future<Either<Failure, Unit>> createAppointment(UuidV4 doctorId, UuidV4 userId, TimeOfDay hour, DateTime day);

  Future<Either<Failure, Unit>> editAppointment(UuidV4 id, String field, String value);

  Future<Either<Failure, Unit>> deleteAppointment(UuidV4 id);

  Future<Either<Failure, Unit>> acceptingAppointment(UuidV4 id, Acceptance newAccept);

  Future<Either<Failure, List<Appointment>>> filterAppointmentsByAcceptance(String value);
}
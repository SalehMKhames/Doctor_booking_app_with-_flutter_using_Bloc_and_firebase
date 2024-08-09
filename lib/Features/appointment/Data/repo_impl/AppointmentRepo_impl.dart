import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Data/data_sources/Appointment_LocalDataSource.dart';
import 'package:doctory/Features/appointment/Data/data_sources/Appointment_RemoteDataSource.dart';
import 'package:doctory/Features/appointment/Data/model/Appointment_model.dart';
import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/Features/appointment/Domain/repository/appointment_repo.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@LazySingleton(as: AppointmentRepo)
class AppointmentRepoImpl extends AppointmentRepo
{
  final Appointment_RemoteDataSource remoteDataSource;
  final Appointment_Localdatasource localDataSource;

  AppointmentRepoImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> createAppointment(UuidV4 id, String doctorId, String patientId, TimeOfDay hour, String day) async
  {
    try{
      await remoteDataSource.createAppointment(id, doctorId, patientId, hour, day);
      return const Right(unit);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAppointment(UuidV4 id) async
  {
    try{
      final result = await remoteDataSource.deleteAppointment(id as String);
      await localDataSource.sharedPreferences.remove("User_info");
      return Right(result);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> editAppointment(UuidV4 id, String field, String value) async
  {
    try {
      final result = await remoteDataSource.editAppointment(id, field, value);
      return Right(result);
    }
    on ServerException catch (e) {
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch (e) {
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch (e) {
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptingAppointment(UuidV4 id, Acceptance newAccept) async
  {
    try {
      final result = await remoteDataSource.acceptingAppointment(id, newAccept);
      return Right(result);
    }
    on ServerException catch (e) {
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch (e) {
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch (e) {
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> getAllAppointments(UuidV4 id, String userId) async
  {
    try {
      final result = await remoteDataSource.getAllAppointments(id, userId);
      return Right(result);
    }
    on ServerException catch (e) {
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch (e) {
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch (e) {
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, Appointment>> getUserAppointment(UuidV4 id) async
  {
    try {
      final result = await remoteDataSource.getAppointment(id);
      return Right(result);
    }
    on ServerException catch (e) {
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch (e) {
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch (e) {
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Appointment>>> filterAppointmentsByAcceptance(String value) async
  {
    try {
      final result = await remoteDataSource.filterAppointmentsByAcceptance(value);
      return Right(result);
    }
    on ServerException catch (e) {
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch (e) {
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch (e) {
      return left(BadRequestFailure(Message: e.message));
    }
  }
}
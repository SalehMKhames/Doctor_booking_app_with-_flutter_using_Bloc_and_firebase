import 'package:dartz/dartz.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

abstract class DoctorRepo
{
  const DoctorRepo();

  Future<Either<Failure, Doctor>> getDoctorData(String id);
}
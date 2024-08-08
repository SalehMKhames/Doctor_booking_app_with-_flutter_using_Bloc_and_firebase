import 'package:dartz/dartz.dart';
import 'package:doctory/common/Doctor/domain/Repository/Doctor_Repo.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Getdoctorsbyspecialization
{
  DoctorRepo doctorRepo;

  Getdoctorsbyspecialization({required this.doctorRepo});

  Future<Either<Failure, List<Doctor>>> execute(String special) async => await doctorRepo.getDoctorsBySpecial(special);
}
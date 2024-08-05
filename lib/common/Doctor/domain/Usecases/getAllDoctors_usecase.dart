import 'package:dartz/dartz.dart';
import 'package:doctory/common/Doctor/domain/Repository/Doctor_Repo.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetalldoctorsUsecase
{
  DoctorRepo doctorRepo;

  GetalldoctorsUsecase({required this.doctorRepo});

  Future<Either<Failure, List<Doctor>>> execute() async => await doctorRepo.getAllDoctor();
}
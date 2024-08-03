import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:doctory/common/Doctor/data/model/Doctor_model.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';

import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class DoctorLocaldatasource
{
  final SharedPreferences sharedPreferences;

  DoctorLocaldatasource({required this.sharedPreferences});

  Future<Unit> cachingDoctor(String keyName, DoctorModel doctor) async
  {
    final cachedDoctorInfo = doctor.toJson();
    await sharedPreferences.setString(keyName, json.encode(cachedDoctorInfo));
    return Future.value(unit);
  }

  Future<Doctor> getCachedDoctor(String keyName) async
  {
    final doctorKey = sharedPreferences.getString(keyName);

    if(doctorKey != null) {
      return DoctorModel.fromJson(json.decode(doctorKey));
    }
    else{
      throw EmptyCacheException("There is No information about the doctor you ara asking about, try to connect to the internet and try later");
    }
  }
}
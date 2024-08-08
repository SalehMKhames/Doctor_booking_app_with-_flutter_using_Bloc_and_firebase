import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Data/model/Appointment_model.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class Appointment_Localdatasource
{
  final SharedPreferences sharedPreferences;

  Appointment_Localdatasource({required this.sharedPreferences});

  Future<Unit> cachingUser(String keyName, AppointmentModel appoint) async
  {
    final cachedAppointInfo = appoint.toJson();
    await sharedPreferences.setString(keyName, json.encode(cachedAppointInfo));
    return Future.value(unit);
  }

  Future<AppointmentModel> getCachedUser(String keyName) async
  {
    final appointKey = sharedPreferences.getString(keyName);

    if(appointKey != null) {
      return AppointmentModel.fromJson(json.decode(appointKey));
    }
    else{
      throw EmptyCacheException("There is No information about you now, connect to the internet and try later");
    }
  }
}
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalSource
{
  final SharedPreferences sharedPreferences;

  UserLocalSource({required this.sharedPreferences});

  Future<Unit> cachedUser(String keyName, User user) async
  {
    final cachedUserInfo = user.toJson();
    await sharedPreferences.setString(keyName, json.encode(cachedUserInfo));
    return Future.value(unit);
  }

  Future<Unit> cachedUserCredentials(String keyName, UserCredentials userCred) async
  {
    final cachedCred = userCred.toJson();
    await sharedPreferences.setString(keyName, json.encode(cachedCred));
    return Future.value(unit);
  }

  Future<User> getCachedUser(String keyName) async
  {
    final userInfo = sharedPreferences.getString(keyName);

    if(userInfo != null) {
      return User.fromJson(json.decode(userInfo));
    }
    else{
      throw EmptyCacheException("There is No ");
    }
  }

  Future<User> getCachedUserCredentials(String keyName) async
  {
    final userCred = sharedPreferences.getString(keyName);

    if(userCred != null) {
      return User.fromJson(json.decode(userCred));
    }
    else{
      throw EmptyCacheException();
    }
  }
}
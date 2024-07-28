import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/data/Model/UserModel.dart';

import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class UserLocalSource
{
  final SharedPreferences sharedPreferences;

  UserLocalSource({required this.sharedPreferences});

  Future<Unit> cachingUser(String keyName, UserModel user) async
  {
    final cachedUserInfo = user.toJson();
    await sharedPreferences.setString(keyName, json.encode(cachedUserInfo));
    return Future.value(unit);
  }

  Future<User> getCachedUser(String keyName) async
  {
    final userKey = sharedPreferences.getString(keyName);

    if(userKey != null) {
      return UserModel.fromJson(json.decode(userKey));
    }
    else{
      throw EmptyCacheException("There is No information about your credentials now, connect to the internet and try later");
    }
  }
}
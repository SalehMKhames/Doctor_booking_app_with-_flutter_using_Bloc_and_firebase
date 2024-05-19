import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalSource
{
  final SharedPreferences sharedPreferences;

  UserLocalSource({required this.sharedPreferences});

  Future<Unit> cachingUser(String keyName, User user) async
  {
    final cachedUserInfo = user.toJson();
    await sharedPreferences.setString(keyName, json.encode(cachedUserInfo));
    return Future.value(unit);
  }

  Future<User> getCachedUser(String keyName) async
  {
    final userInfo = sharedPreferences.getString(keyName);

    if(userInfo != null) {
      return User.fromJson(json.decode(userInfo));
    }
    else{
      throw EmptyCacheException("There is No information about your credentials now, connect to the internet and try later");
    }
  }
}
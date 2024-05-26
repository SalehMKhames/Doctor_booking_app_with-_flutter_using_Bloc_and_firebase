import 'dart:convert';

import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalSource
{
  final SharedPreferences sharedPreferences;

  AuthLocalSource({required this.sharedPreferences});

  Future<void> cachingUserCredentials(String keyName, UserCredentials userCred) async
  {
    final cachedCred = userCred.toJson();
    await sharedPreferences.setString(keyName, json.encode(cachedCred));
  }

  Future<User> getCachedUserCredentials(String keyName) async
  {
    final userCred = sharedPreferences.getString(keyName);

    if(userCred != null) {
      return User.fromJson(json.decode(userCred));
    }
    else{
      throw EmptyCacheException("There is no information about your credentials now. Please connect the Internet and try again");
    }
  }

}
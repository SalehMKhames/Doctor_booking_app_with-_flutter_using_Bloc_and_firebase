import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/data/Model/UserModel.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/utils/Strings.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton()
class UserRemotedatasource
{
  http.Client client;

  UserRemotedatasource({required this.client});

  Future<Unit> uploadData(UserModel user) async
  {
    final response = await http.post(
        Uri.parse("$DataBaseURL/Users"),
        body: {user.toJson()},
    );

    if(response.statusCode == 201) { //on Created status
      return Future.value(unit);
    }
    else if(response.statusCode == 400) //on bad request
    {
      throw BadRequestException("Sorry, We can't get your data now. Please try again");
    }
    else if (response.statusCode == 401) // UnAuthorized
    {
      throw UnauthorizedException("Unfortunately, you don't have the permission to see this kind of data");
    }
    else
    { throw ServerException("Sorry, there is some error we're trying to fix it");}

  }

  Future<UserModel> getUserData(String id) async
  {
    final response = await client.get("$DataBaseURL/Users/$id" as Uri,);

    if (response.statusCode == 200) {
       final data = json.decode(response.body);
       final UserModel userData = UserModel.fromJson(data);

       return userData;
    }
    else if(response.statusCode == 400) {
      throw BadRequestException("Sorry, We can't get your data now. Please try again");
    }
    else if (response.statusCode == 401) {
      throw UnauthorizedException("Unfortunately, you don't have the permission to see this kind of data");
    }
    else { throw ServerException("Sorry, there is some error we're trying to fix it");}
  }

}
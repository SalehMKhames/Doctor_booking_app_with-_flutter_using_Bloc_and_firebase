import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/utils/Strings.dart';
import 'package:http/http.dart' as http;

import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

class UserRemoteSource
{
  final http.Client client;

  UserRemoteSource({required this.client,});

  Future<UserCredentials> Register(String email, String password) async
  {
      final res = await client.post(
        Uri.parse(SignUpURL),
        body: json.encode({'email' : email, 'password' : password, 'returnSecureToken' : true})
      );

      if (res.statusCode == 200) //on success
      {
        final userDetails = UserCredentials.fromJson(await json.decode(res.body));
        return userDetails;
      }
      else if(res.statusCode == 400) //on bad request
      {
        throw BadRequestFailure();
      }
      else if (res.statusCode == 401) // UnAutherized
      {
         throw UnauthorizedException();
      }
      else { throw ServerException();}
  }


  Future<UserCredentials> LogIn (String email, String password) async
  {
      final res = await client.post(
        Uri.parse(SignInURL),
        body: json.encode({'email' : email, 'password' : password, 'returnSecureToken' : true})
      );

      if (res.statusCode == 200) //on success
          {
        final data = await json.decode(res.body);
        final userDetails = UserCredentials.fromJson(data);
        return userDetails;
      }
      else if(res.statusCode == 400) //on bad request
          {
        throw BadRequestFailure();
      }
      else if (res.statusCode == 401) // UnAutherized
          {
        throw UnauthorizedException();
      }
      else { throw ServerException();}
  }

  Future<Unit> ResetPassword(String userID, String newPassword) async
  {
    final response = await client.post(
      Uri.parse(ChangingPassowrURL),
      body: json.encode({'idToken' : userID, 'password' : newPassword, 'returnSecureToken' : true})
    );

    if (response.statusCode == 200) //on success
    {
      return unit;
    }
    else if(response.statusCode == 400) //on bad request
        {
      throw BadRequestFailure();
    }
    else if (response.statusCode == 401) // UnAutherized
        {
      throw UnauthorizedException();
    }
    else { throw ServerException();}
  }

  Future<Unit> DeleteAccount(String userID) async
  {
    final response = await client.post(
      Uri.parse(DeleteUserURL),
      body : json.encode({'idToken' : userID})
    );

    if (response.statusCode == 200) //on success
        {
      return unit;
    }
    else if(response.statusCode == 400) //on bad request
        {
      throw BadRequestFailure();
    }
    else if (response.statusCode == 401) // UnAutherized
        {
      throw UnauthorizedException();
    }
    else { throw ServerException();}
  }

  Future<User> GetUserInfo(String userID) async
  {
    final response = await client.post(
        Uri.parse(GetUserURL),
        body : json.encode({'idToken' : userID})
    );

    if (response.statusCode == 200) //on success
    {
      final data = await json.decode(response.body);
      final userDetails = User.fromJson(data['users']);
      return userDetails;
    }
    else if(response.statusCode == 400) //on bad request
    {
      throw BadRequestFailure();
    }
    else if (response.statusCode == 401) // UnAutherized
    {
      throw UnauthorizedException();
    }
    else { throw ServerException();}
  }
}
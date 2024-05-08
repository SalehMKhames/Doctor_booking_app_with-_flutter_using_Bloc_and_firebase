import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:doctory/authentication/domain/entities/user.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

class UserRemoteSource
{
  final http.Client client;

  UserRemoteSource({required this.client});

  Future<Either<Failure, User>> Register (String email, String password)
  {}

  Future<Either<Failure, User>> LogIn (String email, String password)
  {}


}
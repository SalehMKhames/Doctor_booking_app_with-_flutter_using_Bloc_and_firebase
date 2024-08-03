import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/data/Model/UserModel.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton()
class UserRemotedatasource {
  http.Client client;

  UserRemotedatasource({required this.client});

  Future<UserModel> getUserData(String id) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Users');
      final docRef = collectionRef.doc(id);
      final fireData = await docRef.get();
      final userData = UserModel.fromJson(fireData as Map<String, dynamic>);

      return userData;
    }
    on ServerException{
      throw const ServerFailure(Message: "An unexpected error occurred. Please try again later.");
    }
    on BadRequestException{
      throw const BadRequestFailure(Message: "Invalid request format. Please check your input data.");
    }
    on UnauthorizedException{
      throw const UnauthorizedFailure(Message: "Authentication failed. Please provide valid credentials.");
    }
    on OfflineException{
      throw const OfflineFailure(Message: "You are without Internet connection. Please, try to connect.");
    }
    catch (err){
      throw Exception(err);
    }
  }

  Future<Unit> editUserData(String id, String updatedField, String updatedValue) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Users');
      final docRef = collectionRef.doc(id);
      final fireData = await docRef.update({updatedField : updatedValue});

      return unit;
    }
    on ServerException{
      throw const ServerFailure(Message: "An unexpected error occurred. Please try again later.");
    }
    on BadRequestException{
      throw const BadRequestFailure(Message: "Invalid request format. Please check your input data.");
    }
    on UnauthorizedException{
      throw const UnauthorizedFailure(Message: "Authentication failed. Please provide valid credentials.");
    }
    on OfflineException{
      throw const OfflineFailure(Message: "You are without Internet connection. Please, try to connect.");
    }
    catch (err){
      throw Exception(err);
    }
  }

  Future<Unit> deleteUserData(String id) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Users');
      final docRef = collectionRef.doc(id);
      docRef.delete();

      return unit;
    }
    on ServerException{
      throw const ServerFailure(Message: "An unexpected error occurred. Please try again later.");
    }
    on BadRequestException{
      throw const BadRequestFailure(Message: "Invalid request format. Please check your input data.");
    }
    on UnauthorizedException{
      throw const UnauthorizedFailure(Message: "Authentication failed. Please provide valid credentials.");
    }
    on OfflineException{
      throw const OfflineFailure(Message: "You are without Internet connection. Please, try to connect.");
    }
    catch (err){
      throw Exception(err);
    }
  }
}

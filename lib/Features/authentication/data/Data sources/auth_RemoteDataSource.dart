import 'dart:convert';
import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/data/Model/CredentialsModel.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/utils/Strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@Injectable()
class AuthRemoteSource {
  late final UuidV4 id;
  final http.Client client;

  AuthRemoteSource({required this.client,});

  Future<CredentialsModel> register(String email, String password) async
  {
    final res = await client.post(
        Uri.parse(SignUpURL),
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true})
    );

    if (res.statusCode == 200) //on success
    {
      final userDetails = CredentialsModel.fromJson(await json.decode(res.body));
      id = userDetails.localId as UuidV4;
      return userDetails;
    }
    else if (res.statusCode == 400) //on bad request
        {
      throw BadRequestException(
          "Sorry, We can't get your data now. Please try again");
    }
    else if (res.statusCode == 401) // UnAuthorized
        {
      throw UnauthorizedException(
          "Unfortunately, you don't have the permission to see this kind of data");
    }
    else {
      throw ServerException(
          "Sorry, there is some error we're trying to fix it");
    }
  }


  Future<CredentialsModel> logIn(String email, String password) async
  {
    final res = await client.post(
        Uri.parse(SignInURL),
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true})
    );

    if (res.statusCode == 200) //on success
        {
      final data = await json.decode(res.body);
      final userDetails = CredentialsModel.fromJson(data);
      return userDetails;
    }
    else if (res.statusCode == 400) //on bad request
        {
      throw BadRequestException(
          "Sorry, We can't get your data now. Please try again");
    }
    else if (res.statusCode == 401) // UnAuthorized
        {
      throw UnauthorizedException(
          "Unfortunately, you don't have the permission to see this kind of data");
    }
    else {
      throw ServerException(
          "Sorry, there is some error we're trying to fix it");
    }
  }

  Future<Unit> resetPassword(UuidV4 userID, String newPassword) async
  {
    final response = await client.post(
        Uri.parse(ChangingPassowrURL),
        body: json.encode({
          'idToken': userID,
          'password': newPassword,
          'returnSecureToken': true
        })
    );

    if (response.statusCode == 200) //on success
        {
      return unit;
    }
    else if (response.statusCode == 400) //on bad request
        {
      throw BadRequestException(
          "Sorry, We can't get your data now. Please try again");
    }
    else if (response.statusCode == 401) // UnAuthorized
        {
      throw UnauthorizedException(
          "Unfortunately, you don't have the permission to see this kind of data");
    }
    else {
      throw ServerException(
          "Sorry, there is some error we're trying to fix it");
    }
  }

  Future<Unit> deleteAccount(String userID) async
  {
    final response = await client.post(
        Uri.parse(DeleteUserURL),
        body: json.encode({'idToken': userID})
    );

    if (response.statusCode == 200) //on success
        {
      return unit;
    }
    else if (response.statusCode == 400) //on bad request
        {
      throw BadRequestException(
          "Sorry, We can't delete your account now. Please try again");
    }
    else {
      throw ServerException(
          "Sorry, there is some error we're trying to fix it");
    }
  }

  Future<Unit> uploadData(String dbName, String name, String email, String birthDate, String phone, String medicalStatus) async
  {
    final Map<String, dynamic> userData = {
      'name': name,
      'Email': email,
      'birth': birthDate,
      'phone': phone,
      'status': medicalStatus
    };

    try
    {
      final collectionRef = FirebaseFirestore.instance.collection(dbName);
      final docRef = collectionRef.doc(id as String);
      docRef.set(userData);
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

  Future<Unit> uploadDoctorData(String Database, String name, String bio, XFile profileImage, String special, String address) async
  {
    Uint8List imageBytes = await profileImage.readAsBytes();
    Blob blob = Blob(imageBytes);

    Map<String, dynamic> docData ={
      "Name" : name,
      "Profile_Image" : blob,
      "Bio" : bio,
      "Specialization" : special,
      "Address" : address
    };

    try
    {
      final collectionRef = FirebaseFirestore.instance.collection(Database);
      final docRef = collectionRef.doc(id as String);
      docRef.set(docData);
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

  Future<Unit> signOut() async{
    try{
      await FirebaseAuth.instance.signOut();
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
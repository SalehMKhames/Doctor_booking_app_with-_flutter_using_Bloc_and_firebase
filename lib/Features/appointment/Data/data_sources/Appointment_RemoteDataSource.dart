import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctory/Features/appointment/Data/model/Appointment_model.dart';
import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/v4.dart';

@lazySingleton
class Appointment_RemoteDataSource
{
  http.Client client;

  Appointment_RemoteDataSource({required this.client});

  Future<List<AppointmentModel>> getAllAppointments(UuidV4 id, String userId) async
  {
    try{
      final collectionRef = FirebaseFirestore.instance.collection("Appointments");
      final docRef = collectionRef.where("PatientID", isEqualTo: userId);
      final List<AppointmentModel> data = await docRef.get() as List<AppointmentModel>;

      return data;
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

  Future<AppointmentModel> getAppointment(UuidV4 id) async
  {
    try {
      final collectionRef = FirebaseFirestore.instance.collection(
          "Appointments");
      final docRef = collectionRef.doc(id as String);
      final fireData = docRef.get();
      final appData = AppointmentModel.fromJson(
          fireData as Map<String, dynamic>);

      return appData;
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

  Future<Unit> createAppointment(UuidV4 id, String doctorId, String patientId, TimeOfDay hour, String day) async
  {
    final Map<String, dynamic> appointData = {
      'id' : id,
      'DoctorID' : doctorId,
      'PatientID' : patientId,
      'Hour' : hour,
      'Day' : day,
      'isApproved' : false
    };

    try{
      final collectionRef = FirebaseFirestore.instance.collection("Appointments");
      final docRef = collectionRef.doc(id as String);
      await docRef.set(appointData);
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

  Future<Unit> editAppointment(UuidV4 id, String updatedField, String updatedValue) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Appointments');
      final docRef = collectionRef.doc(id as String);
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

  Future<Unit> deleteAppointment(String id) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Appointments');
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

  Future<Unit> acceptingAppointment(UuidV4 id, Acceptance newAccept) async
  {
    try {
      final collRef = FirebaseFirestore.instance.collection("Appointments");
      final docRef = collRef.doc(id as String);
      docRef.update({"isApproved": newAccept});
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

  Future<List<AppointmentModel>> filterAppointmentsByAcceptance(String value) async
  {
    try{
      final collectionRef = FirebaseFirestore.instance.collection("Appointments");
      final docRef = collectionRef.where("isApproved", isEqualTo: value);
      final List<AppointmentModel> data = await docRef.get() as List<AppointmentModel>;

      return data;
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
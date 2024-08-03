import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/common/Doctor/data/model/Doctor_model.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:http/http.dart' as http;

class DoctorRemotedatasource
{
  http.Client client;

  DoctorRemotedatasource({required this.client});

  Future<DoctorModel> getUserData(String id) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Doctors');
      final docRef = collectionRef.doc(id);
      final fireData = await docRef.get();
      final userData = DoctorModel.fromJson(fireData as Map<String, dynamic>);

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
}
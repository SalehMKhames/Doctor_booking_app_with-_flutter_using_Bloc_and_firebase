import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/common/Doctor/data/model/Doctor_model.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable()
class DoctorRemotedatasource
{
  http.Client client;

  DoctorRemotedatasource({required this.client});

  Future<DoctorModel> getDoctorData(String id) async
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

  Future<List<DoctorModel>> getAllDoctors() async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Doctors');
      final docsData = collectionRef.get() as List<DoctorModel>;

      return docsData;
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

  Future<DoctorModel> getDoctorByName(String name) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Doctors');
      final docRef = collectionRef.where('Name' , isEqualTo: name);
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

  Future<List<DoctorModel>> getDoctorBySpecial(String special) async
  {
    try
    {
      final collectionRef = FirebaseFirestore.instance.collection('Doctors');
      final docRef = collectionRef.where('category' , isEqualTo: special);
      final fireData = await docRef.get() as List<DoctorModel>;
      final doctorsData =fireData.map((item) => DoctorModel.fromJson(item as Map<String, dynamic>)).toList();

      return doctorsData;
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
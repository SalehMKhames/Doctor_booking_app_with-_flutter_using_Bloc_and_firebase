import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:uuid/v4.dart';

class UserModel extends User
{
  const UserModel({
    required super.id,
    required super.Name,
    required super.profilePicture,
    required super.email,
    required super.birthDate,
    required super.phone,
    required super.medicalStatus
  });

  //the function that retrieve tha user's info from Firebase and convert it from JSON to User class
  factory UserModel.fromJson(Map<String, dynamic> jsonMap)
  {
    return UserModel
    (
      id: jsonMap['id'] as UuidV4,
      Name: jsonMap['Name'] as String,
      profilePicture: jsonMap['Profile_Picture'],
      email:  jsonMap["Email"] as String,
      birthDate: jsonMap['birthDate'] as String,
      phone: jsonMap['phone_Number'] as String,
      medicalStatus: jsonMap['MedicalStatus'] as String
    );
  }

  //this function converts User class info to JSON form
  Map<String, dynamic> toJson()
  {
  return {
  'id': id,
  'Name': Name,
  'Profile_Picture' : profilePicture,
  'Email' : email,
  'birthDate': birthDate,
  'phone_Number': phone,
  'MedicalStatus': medicalStatus,
  };
  }
}
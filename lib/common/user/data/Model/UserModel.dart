import 'package:doctory/common/user/domain/entity/user.dart';

class UserModel extends User
{
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required super.phone,
    required super.medicalStatus
  });

  //the function that retrieve tha user's info from Firebase and convert it from JSON to User class
  factory UserModel.fromJson(Map<String, dynamic> jsonMap)
  {
    return UserModel
    (
      id: jsonMap['id'] as String,
      firstName: jsonMap['first_Name'] as String,
      lastName: jsonMap['last_Name'] as String,
      birthDate: jsonMap['birthDate'] as DateTime,
      phone: jsonMap['phone_Number'] as String,
      medicalStatus: jsonMap['MedicalStatus'] as String
    );
  }

  //this function converts User class info to JSON form
  Map<String, dynamic> toJson()
  {
  return {
  'id': id,
  'first_Name': firstName,
  'last_Name': lastName,
  'birthDate': birthDate,
  'phone_Number': phone,
  'MedicalStatus': medicalStatus,
  };
  }
}
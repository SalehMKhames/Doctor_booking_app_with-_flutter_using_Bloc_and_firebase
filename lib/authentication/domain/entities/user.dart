import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:uuid/v4.dart';

class User extends Equatable
{
  final id = const UuidV4();
  final String firstName;
  final String lastName;
  final String? email;
  final String? password;
  final DateTime? birthDate;
  final String? phone;
  final File? photo;
  final String? medicalStatus;

  const User({ required UuidV4 id, required this.firstName, required this.lastName, this.email, this.password, this.birthDate, this.phone, this.photo, this.medicalStatus});

  User copyWith({ UuidV4? iden,String? firstName, String? lastName, String? email, String? pass, DateTime? birth, String? phone, String? Status})
  {
    return User(
        id : iden ?? id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: pass ?? password,
        birthDate: birth ?? birthDate,
        phone: phone ?? this.phone,
        medicalStatus: Status ?? medicalStatus
    );
  }

  //the function that retrieve tha user's info from Firebase and convert it from JSON to User class
  factory User.fromJson(Map<String, dynamic> jsonMap)
  {
    return User
    (
      id : jsonMap['id'] as UuidV4,
      firstName: jsonMap['first_Name'] as String,
      lastName: jsonMap['last_Name'] as String,
      birthDate: jsonMap['birthDate'] as DateTime,
      phone: jsonMap['phone_Number'] as String,
      photo: jsonMap['ProfilePic'] as File,
      medicalStatus: jsonMap['MedicalStatus'] as String
    );
  }

  //this function converts User class info to JSON form
  Map<String, dynamic> toJson()
  {
    return {
      'id' : id,
      'first_Name' : firstName,
      'last_Name' : lastName,
      'birthDate' : birthDate,
      'phone_Number' : phone,
      'ProfilePic' : photo,
      'MedicalStatus' : medicalStatus,
      };
  }

  @override
  List<Object?> get props => [id, firstName, email, password,lastName, birthDate, phone, photo,medicalStatus];
}

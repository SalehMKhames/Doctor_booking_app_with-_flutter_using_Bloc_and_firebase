import 'dart:io';

import 'package:equatable/equatable.dart';

class User extends Equatable
{
  final String id;
  final String firstName;
  final String lastName;

  final DateTime? birthDate;
  final String? phone;
  final File? photo;
  final String? medicalStatus;

  const User({required this.id, required this.firstName, required this.lastName, this.birthDate, this.phone, this.photo, this.medicalStatus});

  User copyWith({ String? iden, String? firstName, String? lastName, String? email, String? pass, DateTime? birth, String? phone, String? Status})
  {
    return User(
        id: iden ?? id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
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
        id: jsonMap['id'] as String,
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
      'id': id,
      'first_Name': firstName,
      'last_Name': lastName,
      'birthDate': birthDate,
      'phone_Number': phone,
      'ProfilePic': photo,
      'MedicalStatus': medicalStatus,
    };
  }

  @override
  List<Object?> get props =>
      [
        id,
        firstName,
        lastName,
        birthDate,
        phone,
        photo,
        medicalStatus
      ];
}

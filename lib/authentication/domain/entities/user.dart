import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:uuid/v4.dart';

class User extends Equatable
{
  final id = const UuidV4();
  final String firstName;
  final String lastName;
  final DateTime? birthDate;
  final String? phone;
  final File? photo;

  const User({ required UuidV4 id, required this.firstName, required this.lastName, this.birthDate, this.phone, this.photo});

  User copyWith({ UuidV4? iden,String? firstName, String? lastName, DateTime? birth, String? phone})
  {
    return User(
        id : iden ?? id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birth ?? birthDate,
        phone: phone ?? this.phone
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
        phone: jsonMap['phone_Number'] as String
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
        'phone_Number' : phone
      };
  }

  @override
  List<Object?> get props => [id, firstName, lastName, birthDate, phone, photo];
}
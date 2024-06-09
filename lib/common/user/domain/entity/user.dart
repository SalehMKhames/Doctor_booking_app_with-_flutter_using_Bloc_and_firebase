import 'package:equatable/equatable.dart';

class User extends Equatable
{
  final String id;
  final String firstName;
  final String lastName;
  final DateTime? birthDate;
  final String? phone;
  final String? medicalStatus;

  const User({required this.id, required this.firstName, required this.lastName, this.birthDate, this.phone, this.medicalStatus});

  User copyWith({
    String? iden,
    String? firstName,
    String? lastName,
    String? email,
    String? pass,
    DateTime? birth,
    String? phone,
    String? Status
  })
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

  @override
  List<Object?> get props =>
      [
        id,
        firstName,
        lastName,
        birthDate,
        phone,
        medicalStatus
      ];
}

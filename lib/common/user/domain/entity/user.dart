import 'package:equatable/equatable.dart';
import 'package:uuid/v4.dart';

class User extends Equatable
{
  final UuidV4 id;
  final String Name;
  final String email;
  final String? birthDate;
  final String? phone;
  final String? medicalStatus;

  const User({required this.id, required this.Name, required this.email, this.birthDate, this.phone, this.medicalStatus});

  User copyWith({
    UuidV4? iden,
    String? Name,
    String? email,
    String? birth,
    String? phone,
    String? Status
  })
  {
    return User(
        id: iden ?? id,
        Name: Name ?? this.Name,
        email: email ?? this.email,
        birthDate: birth ?? birthDate,
        phone: phone ?? this.phone,
        medicalStatus: Status ?? medicalStatus
    );
  }

  @override
  List<Object?> get props =>
      [
        id,
        Name,
        email,
        birthDate,
        phone,
        medicalStatus
      ];
}

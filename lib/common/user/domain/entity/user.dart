import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/v4.dart';

class User extends Equatable
{
  final UuidV4 id;
  final String Name;
  final String email;
  final XFile? profilePicture;
  final String? birthDate;
  final String? phone;
  final String? medicalStatus;

  const User({required this.id, required this.Name, required this.profilePicture, required this.email, this.birthDate, this.phone, this.medicalStatus});

  User copyWith({
    UuidV4? iden,
    String? Name,
    XFile? profile_pricture,
    String? email,
    String? birth,
    String? phone,
    String? Status
  })
  {
    return User(
        id: iden ?? id,
        Name: Name ?? this.Name,
        profilePicture: profile_pricture ?? profilePicture,
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
        profilePicture,
        email,
        birthDate,
        phone,
        medicalStatus
      ];
}

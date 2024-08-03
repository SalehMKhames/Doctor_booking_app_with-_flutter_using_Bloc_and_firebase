import 'package:doctory/common/Doctor/domain/entity/doctor.dart';

class DoctorModel extends Doctor {
  const DoctorModel(
      {required super.id,
      required super.name,
      required super.bio,
      required super.profileImageUrl,
      required super.category,
      required super.address,
      required super.package,
      required super.workingHours
      }
  );

  factory DoctorModel.fromJson(Map<String, dynamic> jsonMap)
  {
      return DoctorModel
      (
          id: jsonMap['id'],
          name: jsonMap['Name'],
          bio: jsonMap['Bio'],
          profileImageUrl: jsonMap['Image'],
          address: jsonMap['Address'],
          category:jsonMap['Category'],
          package:  jsonMap['Package'],
          workingHours: jsonMap['Working_Hours']
      );
  }

  Map<String, dynamic> toJson()
  {
    return
        {
            'id' : id,
            'Name' : name,
            'Bio' : bio,
            'Image' : profileImageUrl,
            'Address' : address,
            'Package' : package,
            'Working_Hours' : workingHours
        };
  }
}

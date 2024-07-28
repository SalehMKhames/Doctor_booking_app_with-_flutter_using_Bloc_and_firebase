import 'package:doctory/core/utils/src/doctor_address.dart';
import 'package:doctory/core/utils/src/doctor_category.dart';
import 'package:doctory/core/utils/src/doctor_package.dart';
import 'package:doctory/core/utils/src/doctor_working_hours.dart';

import 'package:equatable/equatable.dart';


class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final DoctorCategory category;
  final DoctorAddress address;
  final List<DoctorPackage> package;
  final List<DoctorWorkingHours> workingHours;
  final double rating ;
  final int reviewCount;
  final int patientCount;

  const Doctor ({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.category,
    required this.address,
    required this.package,
    required this.workingHours,
    this.rating =0.0,
    this.reviewCount = 0,
    this.patientCount = 0,

  });

  @override
  List<Object?> get props => [
    id,
    name,
    bio,
    profileImageUrl,
    workingHours,
    category,
    address,
    package,
    rating,
    reviewCount,
    patientCount,
  ];

  static final sampleDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. John Doe',
      bio: 'Dr. John Doe is a cardiologist in New York',
      profileImageUrl: 'images/1.png',
      category: DoctorCategory.familyMedicine ,
      address: DoctorAddress.sampleAddresses[0] ,
      package: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '2',
      name: 'Dr. Jane Doe',
      bio: 'Dr. Jane Doe is Dentist',
      profileImageUrl: 'images/2.jpg',
      category: DoctorCategory.generalSurgery ,
      address: DoctorAddress.sampleAddresses[0] ,
      package: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),

  ];


}
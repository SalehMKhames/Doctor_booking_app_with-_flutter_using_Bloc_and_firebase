import 'dart:ui';

import 'package:doctory/core/utils/src/doctor_address.dart';
import 'package:doctory/core/utils/src/doctor_category.dart';
import 'package:doctory/core/utils/src/doctor_package.dart';
import 'package:doctory/core/utils/src/doctor_working_hours.dart';

import 'package:equatable/equatable.dart';


class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final Image profileImage;
  final String category;
  final String address;
  final List<DoctorPackage> package;
  final List<DoctorWorkingHours> workingHours;
  final double rating ;


  const Doctor ({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
    required this.category,
    required this.address,
    required this.package,
    required this.workingHours,
    this.rating =0.0,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    bio,
    profileImage,
    workingHours,
    category,
    address,
    package,
    rating,
  ];

  static final sampleDoctors = [
    Doctor(
      id: '1' ,
      name: 'Dr. John Doe',
      bio: 'Dr. John Doe is a cardiologist in New York',
      profileImage: 'images/1.png' as Image,
      category: DoctorCategory.familyMedicine.name ,
      address: DoctorAddress.sampleAddresses[0].city ,
      package: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
    ),
    Doctor(
      id: '2' ,
      name: 'Dr. Jane Doe',
      bio: 'Dr. Jane Doe is Dentist',
      profileImage: 'images/2.jpg' as Image,
      category: DoctorCategory.generalSurgery.name ,
      address: DoctorAddress.sampleAddresses[0].city ,
      package: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
    ),

  ];


}
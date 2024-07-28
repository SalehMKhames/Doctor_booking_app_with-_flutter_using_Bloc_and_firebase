import 'package:equatable/equatable.dart';


class DoctorAddress extends Equatable {
  final String id;
  final String doctorId;
  final String streetAddress;
  final String streetNumber;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  const DoctorAddress({
    required this.id,
    required this.doctorId,
    required this.streetAddress,
    required this.streetNumber,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  DoctorAddress copyWith({
    String? id,
    String? doctorId,
    String? streetAddress,
    String? streetNumber,
    String? city,
    String? state,
    String? country,
    String? postalCode, 
  }) {
    return DoctorAddress(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      streetAddress: streetAddress ?? this.streetAddress, 
      streetNumber: streetNumber ?? this.streetNumber, 
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ??this.country,
      postalCode: postalCode ?? this.postalCode,
    );
  }
  
  @override
  List<Object?> get props => [
    id,
    doctorId,
    streetAddress,
    streetNumber,
    city,
    country,
    postalCode,
  ];

  static const sampleAddresses = [
    DoctorAddress(
      id: '1',
     doctorId: '1', 
      streetAddress: 'Al Maktoum Street',
       streetNumber: '123', 
       city: 'Dubai',
        state: 'Dubai',
         country: 'United Arab Emirates',
          postalCode: '12345',
          ),
  ];

}
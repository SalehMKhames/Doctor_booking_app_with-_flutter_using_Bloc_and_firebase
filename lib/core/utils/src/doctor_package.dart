import 'package:doctory/core/utils/src/consultation_mode.dart';
import 'package:equatable/equatable.dart';

class DoctorPackage extends Equatable {
  final String id;
  final String doctorId;
  final String packageName;
  final String description;
  final Duration duration;
  final double price;
  final ConsultationMode consultationMode;

  const DoctorPackage({
    required this.id,
    required this.doctorId,
    required this.packageName,
    required this.description,
    required this.duration,
    required this.price,
    required this.consultationMode,
  });

  DoctorPackage copyWith(
    {
      String? id,
      String? doctorId,
      String? packageName,
      String? description,
      Duration? duration,
      double? price,
      ConsultationMode? consultationMode
    })
  {
    return DoctorPackage(
        id: id ?? this.id,
        doctorId: doctorId ?? this.doctorId,
        packageName: packageName ?? this.packageName,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        price: price ?? this.price,
        consultationMode: consultationMode ?? this.consultationMode
    );
  }

  @override
  List<Object?> get props => [
        id,
        doctorId,
        packageName,
        description,
        duration,
        price,
        consultationMode
  ];

  static const samplePackages = [
    DoctorPackage(
      id: '1',
      doctorId: '1',
      packageName: 'Basic',
      description: 'Basic consultation package',
      duration: Duration(minutes: 60),
      price: 200,
      consultationMode: ConsultationMode.video,
    ),
    DoctorPackage(
      id: '2',
      doctorId: '1',
      packageName: 'Standard',
      description: 'Standard consultation package',
      duration: Duration(minutes: 60),
      price: 200,
      consultationMode: ConsultationMode.inPerson,
    ),
    DoctorPackage(
      id: '3',
      doctorId: '1',
      packageName: 'Premium',
      description: 'Premium consultation package',
      duration: Duration(minutes: 60),
      price: 300,
      consultationMode: ConsultationMode.video,
    ),
  ];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

enum Acceptance{wait, accepted, refused}

class Appointment extends Equatable
{
  UuidV4 id = const UuidV4();
  final String doctorId;
  final String patientId;
  final TimeOfDay hour;
  final String day;
  final Acceptance isApproved;

  Appointment({
      required this.id,
      required this.doctorId,
      required this.patientId,
      required this.hour,
      required this.day,
      this.isApproved = Acceptance.wait
  });

  @override
  List<Object?> get props => [id, doctorId, patientId, hour, day, isApproved];

  Appointment copyWith(UuidV4? id, String? doctorId, String? patientId, TimeOfDay? hour, String? day, Acceptance? isApproved)
  {
    return Appointment
    (
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      patientId: patientId ?? this.patientId,
      hour: hour ?? this.hour,
      day: day ?? this.day,
      isApproved: isApproved ?? this.isApproved
    );
  }
}

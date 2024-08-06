import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

class Appointment extends Equatable
{
  final UuidV4 id;
  final String doctorId;
  final String patientId;
  final TimeOfDay hour;
  final String day;
  final bool isApproved;

  const Appointment({
      required this.id,
      required this.doctorId,
      required this.patientId,
      required this.hour,
      required this.day,
      this.isApproved = false
  });

  @override
  List<Object?> get props => [id, doctorId, patientId, hour, day, isApproved];

  Appointment copyWith(UuidV4? id, String? doctorId, String? patientId, TimeOfDay? hour, String? day, bool? isApproved)
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

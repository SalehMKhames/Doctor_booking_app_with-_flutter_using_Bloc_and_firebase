import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

class AppointmentModel extends Appointment {
  AppointmentModel({
      required super.id,
      required super.doctorId,
      required super.patientId,
      required super.hour,
      required super.day,
      required isApproved
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> jsonMap)
  {
    return AppointmentModel
    (
      id: jsonMap['id'] as UuidV4,
      doctorId: jsonMap['DoctorID'],
      patientId: jsonMap['PatientID'],
      hour: jsonMap['Hour'] as TimeOfDay,
      day: jsonMap['Day'],
      isApproved: jsonMap['isApproved']
    );
  }

  Map<String, dynamic> toJson()
  {
    return {
      'id' : id,
      'DoctorID' : doctorId,
      'PatientID' : patientId,
      'Hour' : hour,
      'Day' : day,
      'isApproved' : isApproved
    };
  }
}

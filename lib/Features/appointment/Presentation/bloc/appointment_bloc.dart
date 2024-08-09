import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:injectable/injectable.dart';
import '../../Domain/usecases/CreateAppointment_usecase.dart';
import '../../Domain/usecases/EditAppointment_usecase.dart';
import '../../Domain/usecases/DeleteAppointment_usecase.dart';
import '../../Domain/usecases/AcceptingAppointment_usecase.dart';
import '../../Domain/usecases/GetAllAppointments_usecase.dart';
import '../../Domain/usecases/GetAppointment_usecase.dart';
import '../../Domain/usecases/filterAppointment_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

part 'appointment_event.dart';

part 'appointment_state.dart';

@Injectable()
class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final CreateappointmentUsecase createUsecase;
  final EditappointmentUsecase editUSecase;
  final DeleteappointmentUsecase deleteUsecase;
  final AcceptingappointmentUsecase acceptingusecase;
  final GetappointmentUsecase getuserappointments;
  final GetAllappointmentsUsecase getAllappointments;
  final FilterappointmentUsecase filterAppointment;


  AppointmentBloc(
      this.createUsecase,
      this.editUSecase,
      this.deleteUsecase,
      this.acceptingusecase,
      this.getAllappointments,
      this.getuserappointments,
      this.filterAppointment
      ):super(const AppointmentState()) {
    on<CreateEvent>(_onCreate);
    on<EditAppointEvent>(_onEdit);
    on<DeleteAppointEvent>(_onDelete);
    on<AcceptingEvent>(_onAccepting);
    on<GetAllAppointmentsEvent>(_getAllAppoints);
    on<GetUserAppointmentsEvent>(_getAppointment);
    on<FilterEvent>(_filterAppoint);
  }

  FutureOr<void> _onCreate(CreateEvent event,
      Emitter<AppointmentState> emit) async
  {
    emit(state.copyWith(
      accept: Acceptance.wait,
      createAppointmentStatus: AppointmentStatus.loading,
    ));
    final res = await createUsecase.execute(
        event.id, event.doctorId, event.userId, event.hour, event.day);

    res.fold(
            (fail) =>
            emit(state.copyWith(
                createAppointmentStatus: AppointmentStatus.failure,
                message:
                "Sorry, we cannot booking your appointment now please try later in few moments.")),
            (success) =>
            emit(state.copyWith(
                accept: Acceptance.wait,
                createAppointmentStatus: AppointmentStatus.success,
                message: "Your appointment has been booked successfully."))
    );
  }

  FutureOr<void> _onEdit(EditAppointEvent event, Emitter<AppointmentState> emit) async
  {
    emit(state.copyWith(
        editAppointmentStatus: AppointmentStatus.loading
    ));
    final res = await editUSecase.execute(event.id, event.field, event.newValue);

    res.fold(
            (fail) =>
            emit(state.copyWith(
                editAppointmentStatus: AppointmentStatus.failure,
                message: "Sorry, you cannot reschedule your appointment now, please try later"
            )),
            (success) =>
            emit(state.copyWith(
                editAppointmentStatus: AppointmentStatus.success,
                message: "You have been reschedule."
            ))
    );
  }

  FutureOr<void> _onDelete(DeleteAppointEvent event, Emitter<AppointmentState> emit) async
  {
    emit(state.copyWith(
        deleteAppointmentStatus: AppointmentStatus.loading
    ));
    final res = await deleteUsecase.execute(event.id);

    res.fold(
            (fail) =>
            emit(state.copyWith(
                deleteAppointmentStatus: AppointmentStatus.failure,
                message: "Sorry, you cannot delete your appointment now, please try later"
            )),
            (success) =>
            emit(state.copyWith(
                editAppointmentStatus: AppointmentStatus.success,
                message: "Your appointment has been deleted."
            ))
    );
  }

  FutureOr<void> _onAccepting(AcceptingEvent event, Emitter<AppointmentState> emit) async
  {
    emit(state.copyWith(
        accept: Acceptance.wait,
        appointmentAcceptedStatus: AppointmentStatus.loading
    ));
    final res = await acceptingusecase.execute(event.id, event.isAccepted);

    res.fold(
            (fail) =>
            emit(state.copyWith(
                editAppointmentStatus: AppointmentStatus.failure,
                message: "Sorry, you cannot reschedule your appointment now, please try later"
            )),
            (success) =>
            emit(state.copyWith(
                editAppointmentStatus: AppointmentStatus.success,
                message: "You have been reschedule."
            ))
    );
  }

  FutureOr<void> _getAllAppoints(GetAllAppointmentsEvent event, Emitter<AppointmentState> emit) async
  {
    emit(state.copyWith(getAppointmentStatus: AppointmentStatus.loading));
    final response = await getAllappointments.execute(event.id, event.userId);

    response.fold(
        (fail) =>
        emit(state.copyWith(
          getAllAppointmentsStatus: AppointmentStatus.failure,
          message: "Sorry, We cannot get your appointments now. Please, try again later."
        )),
        (success) =>
        emit(state.copyWith(
          appoints: success,
          getAllAppointmentsStatus: AppointmentStatus.success,
        ))
    );
  }

  FutureOr<void> _getAppointment(GetUserAppointmentsEvent event, Emitter<AppointmentState> emit) async
  {
    emit(state.copyWith(getAppointmentStatus: AppointmentStatus.loading));
    final response = await getuserappointments.execute(event.id);

    response.fold(
            (fail) =>
            emit(state.copyWith(
                getAppointmentStatus: AppointmentStatus.failure,
                message: "Sorry, We cannot get your appointment now. Please, try again later."
            )),
            (success) =>
            emit(state.copyWith(
              appointment: success,
              getAppointmentStatus: AppointmentStatus.success,
            ))
    );
  }

  FutureOr<void> _filterAppoint(FilterEvent event, Emitter<AppointmentState> emit) async
  {
    emit(state.copyWith(filterAppointmentsStatus: AppointmentStatus.loading));
    final response = await filterAppointment.execute(event.value as String);

    response.fold(
            (fail) =>
            emit(state.copyWith(
                filterAppointmentsStatus: AppointmentStatus.failure,
                message: "Sorry, We cannot get your appointment now. Please, try again later."
            )),
            (success) =>
            emit(state.copyWith(
              appoints: success,
              filterAppointmentsStatus: AppointmentStatus.success,
            ))
    );
  }
}

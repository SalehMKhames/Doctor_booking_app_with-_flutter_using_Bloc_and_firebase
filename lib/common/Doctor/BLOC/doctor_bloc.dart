import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../Doctor/domain/Usecases/getDoctor_usecase.dart';
import '../../Doctor/domain/Usecases/getAllDoctors_usecase.dart';
import '../../Doctor/domain/Usecases/getDoctorByName_usecase.dart';
import '../../Doctor/domain/Usecases/getDoctorsBySpecialization_usecase.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

@Injectable()
class DoctorBloc extends Bloc<DoctorEvent, DoctorState>
{
  final Getdoctorusecase getDoctor;
  final GetalldoctorsUsecase getAllDoctors;
  final GetdoctorbynameUsecase getDoctorsByName;
  final Getdoctorsbyspecialization getDoctorBySpecial;

  DoctorBloc(
    this.getDoctor,
    this.getAllDoctors,
    this.getDoctorsByName,
    this.getDoctorBySpecial
  ) : super(const DoctorState())
  {
    on<GetDoctorEvent>(_getDoctor);
    on<GetAllDoctorsEvent>(_getAllDoctors);
    on<GetDoctorByNameEvent>(_getDoctorByName);
    on<GetDoctorsBySpecialEvent>(_getDoctorsBySpecial);
  }



  FutureOr<void> _getDoctor(GetDoctorEvent event, Emitter<DoctorState> emit) async
  {
    emit(state.copyWith(getDoctorState: DoctorStatus.loading));
    final res = await getDoctor.execute(event.id);

    res.fold(
    (fail) => emit(state.copyWith(getDoctorState: DoctorStatus.failed, message: "Sorry, we can not get doctor's data right now, please check your connection.")),
    (doctor) => emit(state.copyWith(getDoctorState: DoctorStatus.success, doctor: doctor))
    );
  }

  FutureOr<void> _getAllDoctors(GetAllDoctorsEvent event, Emitter<DoctorState> emit) async
  {
    emit(state.copyWith(getAllDoctorsState: DoctorStatus.loading));
    final res = await getAllDoctors.execute();

    res.fold(
      (fail) => emit(state.copyWith(getDoctorState: DoctorStatus.failed, message: "Sorry, we can not get doctor's data right now, please check your connection.")),
      (doctors) => emit(state.copyWith(getAllDoctorsState: DoctorStatus.success, allDoctors: doctors))
    );
  }

  FutureOr<void> _getDoctorByName(GetDoctorByNameEvent event, Emitter<DoctorState> emit) async
  {
    emit(state.copyWith(getDoctorByNameState: DoctorStatus.loading));
    final res = await getDoctorsByName.execute(event.name);

    res.fold(
       (fail) => emit(state.copyWith(getDoctorState: DoctorStatus.failed, message: "Sorry, we can not get doctor's data right now, please check your connection.")),
       (doctor) => emit(state.copyWith(getDoctorState: DoctorStatus.success, doctor: doctor))
    );
  }



  FutureOr<void> _getDoctorsBySpecial(GetDoctorsBySpecialEvent event, Emitter<DoctorState> emit) async
  {
    emit(state.copyWith(getDoctorsBySpecialState: DoctorStatus.loading));
    final res = await getDoctorBySpecial.execute(event.special);

    res.fold(
       (fail) => emit(state.copyWith(getDoctorsBySpecialState: DoctorStatus.failed, message: "Sorry, we can not get doctors' data right now, please check your connection.")),
       (doctor) => emit(state.copyWith(getDoctorsBySpecialState: DoctorStatus.success, allDoctors: doctor))
    );
  }
}

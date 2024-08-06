import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    on<AppointmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:doctory/Features/appointment/Domain/entity/appointment.dart';
import 'package:doctory/Features/appointment/Presentation/bloc/appointment_bloc.dart';
import 'package:doctory/Features/appointment/Presentation/widgets/success_booked.dart';
import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/MediaQueryconfig.dart';
import 'package:doctory/core/utils/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:uuid/v4.dart';

class BookingPage extends StatefulWidget {
  final UuidV4 doctorId;
  final UuidV4 patientId;

  BookingPage({Key? key,required this.doctorId, required this.patientId}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  //declaration
  CalendarFormat _format = CalendarFormat.month;
  TimeOfDay _focusDay = DateFormat('HH:mm').format(DateTime.now()) as TimeOfDay;
  DateTime _currentDay = DateFormat('yyy-MM-dd').format(DateTime.now()) as DateTime;
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String? token; //get token for insert booking date and time into database

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Config().init(context);
    return BlocListener<AppointmentBloc, AppointmentState>
    (
      listenWhen: (previous, current) =>
      (previous.createAppointmentStatus == AppointmentStatus.loading && current.createAppointmentStatus == AppointmentStatus.failure)
      || (previous.createAppointmentStatus == AppointmentStatus.loading && current.createAppointmentStatus == AppointmentStatus.success),
      listener: (context, state) {
        if (state.createAppointmentStatus == AppointmentStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBar.call(
              "Sorry, we can't make your appointment now. Please, try again later.",
              AppTheme().themData.colorScheme.errorContainer,
              AppTheme().themData.colorScheme.error));

          if (state.createAppointmentStatus == AppointmentStatus.success) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AppointmentBooked()));
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Doctor Details',
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>
          [
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  _tableCalendar(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Center(
                      child: Text(
                        'Select Consultation Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            _isWeekend
                ? SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      alignment: Alignment.center,
                      child: const Text(
                        'Weekend is not available, please select another date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                              _timeSelected = true;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: _currentIndex == index
                                  ? Config.primaryColor
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 9}:00 ${index + 9 > 12 ? "PM" : "AM"}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _currentIndex == index
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 8,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, childAspectRatio: 1.5),
                  ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (_timeSelected == false || _dateSelected == false)
                              ? const Color.fromARGB(159, 255, 255, 255)
                              : const Color.fromARGB(255, 13, 213, 149)),
                  onPressed: () {
                    if (_timeSelected == true && _dateSelected == true) {
                      BlocProvider.of<AppointmentBloc>(context).add(
                          CreateEvent(
                              doctorId: widget.doctorId,
                              userId: widget.patientId,
                              hour: _focusDay,
                              day: _currentDay,
                              initAcceptance:Acceptance.wait,
                          ));
                    }
                  },
                  child: const Text(
                    "Make Appointment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //table calendar
  Widget _tableCalendar() {
    return TableCalendar
    (
      focusedDay: _focusDay as DateTime,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Config.primaryColor, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay as TimeOfDay;
          _dateSelected = true;

          //check if weekend is selected
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}

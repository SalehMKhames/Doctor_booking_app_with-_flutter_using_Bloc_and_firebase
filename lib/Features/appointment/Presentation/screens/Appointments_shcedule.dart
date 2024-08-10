import 'package:doctory/core/Themes/App_Theme.dart';
import 'package:doctory/core/utils/MediaQueryconfig.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

//enum for appointment status
enum FilterStatus { Waiting, Accepted, Refused }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.Waiting; //initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Richard Tan",
      "doctor_profile": "assets/1.jpg",
      "category": "Dental",
      "status": FilterStatus.Waiting,
    },
    {
      "doctor_name": "Johnny sins",
      "doctor_profile": "assets/2.jpg",
      "category": "Respiration",
      "status": FilterStatus.Accepted,
    },
    {
      "doctor_name": "Oamiry sins",
      "doctor_profile": "assets/1.jpg",
      "category": "Respiration",
      "status": FilterStatus.Refused,
    }
  ];

  @override
  Widget build(BuildContext context)
  {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return SafeArea
    (
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              S.of(context).Appointment_Schedule,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //this is the filter tabs
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Waiting) {
                                  status = FilterStatus.Waiting;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Accepted) {
                                  status = FilterStatus.Accepted;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Refused) {
                                  status = FilterStatus.Refused;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppTheme().themData.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(schedule['doctor_profile']),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    schedule['doctor_name'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    schedule['category'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const ScheduleCard(),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: status != FilterStatus.Accepted
                                      ? OutlinedButton(
                                          onPressed: () {},
                                          child: Text(
                                            S.of(context).Cancel,
                                          ),
                                        )
                                      : const Padding(
                                          padding: EdgeInsets.only(right: 90),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: status != FilterStatus.Accepted
                                      ? OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor: AppTheme()
                                                  .themData
                                                  .primaryColor),
                                          onPressed: () {},
                                          child: Text(
                                            S.of(context).Reschedule,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      : const SizedBox()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Monday,11/22/2024',
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '2:00 PM',
          ))
        ],
      ),
    );
  }
}

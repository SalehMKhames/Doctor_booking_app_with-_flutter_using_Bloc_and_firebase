import 'package:doctory/Features/appointment/Presentation/screens/Booking.dart';
import 'package:doctory/common/Doctor/BLOC/doctor_bloc.dart';
import 'package:doctory/common/user/BLOC/user_bloc.dart';
import 'package:doctory/core/utils/MediaQueryconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DoctorProfile extends StatefulWidget
{
  final String id;

  const DoctorProfile({Key? key, required this.id}) : super(key: key);
  @override
  State<DoctorProfile> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Doctor Details',
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      //if doc id is already ex
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const AboutDoctor(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 13, 213, 149)),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BookingPage
                        (
                          doctorId: widget.id,
                          patientId: BlocProvider.of<UserBloc>(context).state.data!.id as String,)
                        ));
                  },
                  child: const Text(
                    "Book Appointment",
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
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  //final Map<dynamic, dynamic> doctor;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state)
      {
        return Column(
          children: [
            SizedBox
              (
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65.0,
                    backgroundImage: state.doctor!.profileImage as FileImage,
                    backgroundColor: Colors.white,
                  ),
                  Config.spaceMedium,
                  Text(
                    "Dr. ${state.doctor!.name}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Config.spaceSmall,
                  SizedBox(
                    width: Config.widthSize * 0.75,
                    child: Text(
                      state.doctor!.category,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Config.spaceSmall,
                  SizedBox(
                    width: Config.widthSize * 0.75,
                    child: Text(
                      state.doctor!.address,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Config.spaceSmall,
                  const DoctorInfo(
                    patients: 4,
                    exp: 4,
                  ),
                  Config.spaceMedium,
                  const Text(
                    'About Doctor',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Config.spaceSmall,
                  Text(
                    state.doctor!.bio,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class DoctorInfo extends StatelessWidget
{
  const DoctorInfo({Key? key, required this.patients, required this.exp})
      : super(key: key);

  final int patients;
  final int exp;

  @override
  Widget build(BuildContext context)
  {
    return const Row(
      children: <Widget>[
        InfoCard(
          label: 'Patients',
          value: '20',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experiences',
          value: '18 years',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:doctory/Features/appointment/Presentation/screens/Appointments_shcedule.dart';
import 'package:doctory/Features/home/pages/StartPage.dart';
import 'package:doctory/Features/home/pages/profile_page.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  final String id;
  const HomeScreen({super.key, required this.id});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [StartPage(id: widget.id), const AppointmentPage(), const ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[curr],
      bottomNavigationBar: buildNavigationBar(context),
    );
  }

  int curr = 0;

  BottomNavigationBar buildNavigationBar(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: curr,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index)
        {
          case 0:
            setState(() {curr = index;});
            break;
          case 1:
            setState(() {curr = index;});
            break;
          case 2:
            setState(() {curr = index;});
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Appointment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/success.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Successfully Booked',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            //back to home page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 13, 213, 149)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Back to Home Page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

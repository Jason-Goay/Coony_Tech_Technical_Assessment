import 'package:flutter/material.dart';
import 'package:my_app/Screens/booking_screen.dart';
import 'package:my_app/Screens/letter_of_appointment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical Assessment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // LetterOfAppointmentScreen(),
          BookingScreen(),
    );
  }
}

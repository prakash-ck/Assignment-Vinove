import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/attendance_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      home: AttendanceListScreen(),
    );
  }
}

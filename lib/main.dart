import 'package:flutter/material.dart';
import 'package:frd/screens/Login_Screen.dart';
import 'package:frd/screens/home_screen.dart';
import 'package:frd/screens/splash_screen.dart';
import 'package:frd/screens/student_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const StudentScreen(),
    );
  }
}


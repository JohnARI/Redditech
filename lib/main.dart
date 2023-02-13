import 'package:flutter/material.dart';
import 'package:redditech/screens/spashscreen_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redditech',
      home: const SpashScreenWrapper(),
      theme: ThemeData(
        fontFamily: 'IBM',

      ),
    );
  }
}


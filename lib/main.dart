import 'package:flutter/material.dart';
import 'package:redditech/screens/splashscreen_wrapper.dart';

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
      home: const SplashScreenWrapper(),
      theme: ThemeData(
        fontFamily: 'IBM Plex Sans Regular',
      ),
    );
  }
}

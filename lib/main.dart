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
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            color: Colors.black,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        fontFamily: 'IBM Plex Sans',
      ),
    );
  }
}

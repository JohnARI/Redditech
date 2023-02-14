import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      home: const SpashScreenWrapper(),
      theme: ThemeData(
        textTheme: GoogleFonts.ibmPlexMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

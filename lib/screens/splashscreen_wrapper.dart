import 'package:flutter/material.dart';
import 'package:redditech/screens/home/main_home_screen.dart';
import 'dart:async';
import 'package:redditech/screens/main_screen.dart';
import 'package:redditech/screens/auth/auth.dart';
import 'package:redditech/common/const.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SlpashScreenWrapperState();
}

class _SlpashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return const AuthScreen();
  }
}

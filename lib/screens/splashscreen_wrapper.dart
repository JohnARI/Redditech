import 'package:flutter/material.dart';
import 'package:redditech/screens/home/main_home_screen.dart';
import 'dart:async';
import 'package:redditech/screens/main_screen.dart';
import 'package:redditech/screens/auth/auth.dart';
import 'package:redditech/services/api_client.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SlpashScreenWrapperState();
}

class _SlpashScreenWrapperState extends State<SplashScreenWrapper> {
  Future<String>? checkIsAuth() async {
    bool goHomeScreen = await api.checkIsAuth();
    if (goHomeScreen) {
      return "homeScreen";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: checkIsAuth(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.data == "") {
            return const AuthScreen();
          } else {
            return const HomeScreen();
          }
        });
  }
}

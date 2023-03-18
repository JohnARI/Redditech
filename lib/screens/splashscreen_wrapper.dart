import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:redditech/screens/auth/auth.dart';
import 'dart:async';
import 'package:redditech/screens/main_screen.dart';
import 'package:redditech/screens/welcome/main_welcome_screen.dart';
import 'package:redditech/services/api_client.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SlpashScreenWrapperState();
}

class _SlpashScreenWrapperState extends State<SplashScreenWrapper> {
  get clientId => null;

  Future<String> checkIsAuth() async {
    try {
      // String? credentials = await storage.read(key: "credentials");

      // api.reddit = Reddit.restoreAuthenticatedInstance(credentials!,
      //     clientId: "LSrTT-EA8Fm4-0KtiQFV3Q",
      //     clientSecret: "",
      //     userAgent: "Rien",
      //     configUri: Uri.parse("draw.ini"),
      //     redirectUri: Uri.parse("rien://success"));

      return "";
    } catch (exception) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: checkIsAuth(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.data == "") {
            return const WelcomeScreen();
          } else {
            return const MainScreen();
          }
        });
  }
}

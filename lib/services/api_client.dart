import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:redditech/screens/main_screen.dart';
import 'package:redditech/services/api_subreddits.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  Reddit? reddit;
  Uri? authUrl;

  Api() {
    reddit = Reddit.createWebFlowInstance(
      clientId: "LSrTT-EA8Fm4-0KtiQFV3Q",
      clientSecret: "",
      userAgent: "Rien",
      configUri: Uri.parse("draw.ini"),
      redirectUri: Uri.parse("rien://success"),
    );

    authUrl = reddit?.auth.url([
      'read',
      'edit',
      'mysubreddits',
      'history',
      'save',
      'creddits',
      'identity'
    ], 'rien', compactLogin: true);
  }

  Future<bool> authenticate(context) async {
    try {
      final result = await FlutterWebAuth.authenticate(
          url: authUrl.toString(), callbackUrlScheme: "rien");
      String? code = Uri.parse(result).queryParameters['code'];

      await reddit?.auth.authorize(code.toString());

      print("========================================================");

      // print(api.reddit?.auth.credentials.toJson().toString());
      // print(api.reddit?.user.me());
      await storage.write(
          key: "credentials", value: api.reddit!.auth.credentials.toJson());

      print("========================================================");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const MainScreen()));

      return checkIsAuth();
    } catch (error) {
      return checkIsAuth();
    }
  }

  Future<bool> checkIsAuth() async {
    bool isAuth = false;

    try {
      Redditor? me = await reddit?.user.me();

      if (me.toString().isNotEmpty) {
        isAuth = true;
      }

      return isAuth;
    } catch (error) {
      return isAuth;
    }
  }
}

const storage = FlutterSecureStorage();
Api api = Api();

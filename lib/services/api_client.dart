import 'dart:async';
import 'dart:convert';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:redditech/screens/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:redditech/services/api_subreddits.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/auth/auth.dart';

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

    authUrl = reddit?.auth.url(['*'], 'rien', compactLogin: true);
  }

  Future<bool> authenticate(context) async {
    try {
      final result = await FlutterWebAuth.authenticate(
          url: authUrl.toString(), callbackUrlScheme: "rien");

      String? code = Uri.parse(result).queryParameters['code'];

      String? credentials = await storage.read(key: "credentials");
      if (credentials!.isNotEmpty) {
        await reddit?.auth.refresh();
      } else {
        await reddit?.auth.authorize(code.toString());
      }

      await storage.write(
          key: "credentials", value: api.reddit!.auth.credentials.toJson());
      await storage.write(key: "token", value: code);

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

  Future<bool> logout(context) async {
    try {
      await storage.write(key: "credentials", value: "");
      await storage.write(key: "token", value: "");
      api = Api();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const AuthScreen()));
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<http.Response> get(String url, Map<String, String> out) async {
    String? accessToken = await storage.read(key: 'token');

    return http.get(Uri.parse("https://oauth.reddit.com$url"), headers: {
      "Authorization": "Bearer $accessToken",
    });
  }

  Future patch(String api, Map<String, String> out) async {
    String? credentials = await storage.read(key: 'credentials');

    Map<String, dynamic>? credentialsJson = jsonDecode(credentials!);

    return http.patch(Uri.parse("https://oauth.reddit.com$api"),
        body: json.encode(out),
        headers: {
          "Authorization": "Bearer ${credentialsJson!['accessToken']}",
        });
  }
}

const storage = FlutterSecureStorage();
Api api = Api();

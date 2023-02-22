import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:redditech/common/const.dart';

class Auth {
  Reddit? reddit;
  Uri? authUrl;

  Auth() {
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

  Future<bool> authenticate() async {
    try {
      final result = await FlutterWebAuth.authenticate(
          url: authUrl.toString(), callbackUrlScheme: "rien");
      String? code = Uri.parse(result).queryParameters['code'];

      await storage.write(key: "token", value: code);
      await reddit?.auth.authorize(code.toString());

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

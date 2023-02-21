import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

Future<void> apiAuth() async {
  final reddit = Reddit.createWebFlowInstance(
    clientId: "LSrTT-EA8Fm4-0KtiQFV3Q",
    clientSecret: "",
    userAgent: "Rien",
    configUri: Uri.parse("draw.ini"),
    redirectUri: Uri.parse("rien://success"),
  );

  final authUrl = reddit.auth.url(['*'], 'rien', compactLogin: true);

  final result = await FlutterWebAuth.authenticate(
      url: authUrl.toString(), callbackUrlScheme: "rien");
  String? code = Uri.parse(result).queryParameters['code'];
  await reddit.auth.authorize(code.toString());

  print(await reddit.user.me());
}

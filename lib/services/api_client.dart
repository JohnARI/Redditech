import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

Future<void> main() async {
  // Create the `Reddit` instance and authenticated
  Reddit reddit = await Reddit.createScriptInstance(
    clientId: "LSrTT-EA8Fm4-0KtiQFV3Q",
    userAgent: "Rien",
    username: "Any_Focus_2685",
    configUri: Uri.parse("foobar://success"),
  );

  final auth_url = reddit.auth.url(['*'], 'foobar');

  final result = await FlutterWebAuth.authenticate(
      url: auth_url.toString(), callbackUrlScheme: "rien");
  String? code = Uri.parse(result).queryParameters['code'];
  await reddit.auth.authorize(code.toString());
  print(await reddit.user.me());
}

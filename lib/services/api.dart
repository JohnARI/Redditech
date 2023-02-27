import 'package:draw/draw.dart';

abstract class Api {
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

  Future<void> setReddit(code) async {
    await reddit?.auth.authorize(code.toString());
  }
}

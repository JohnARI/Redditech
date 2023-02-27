import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:redditech/screens/main_screen.dart';
import 'package:redditech/services/api.dart';
import 'package:redditech/services/api_client.dart';

class ApiSubreddit {
  Future<bool> test() async {
    try {
      // print(authUrl);
      // String? value = await storage.read(key: "token");
      // await reddit?.auth.authorize(value.toString());

      Redditor? me = await api.reddit?.user.me();
      print(me);
      return true;
    } catch (exception) {
      print("bonjour");
      print(exception);
      return false;
    }
  }

  // Future<void> test2() async {
  //   try {
  //     Stream<Subreddit>? subReddits =
  //         await api.reddit?.user.subreddits(limit: 15);
  //     subReddits?.forEach((element) {
  //       print(element);
  //     });
  //   } catch (exception) {
  //     print(exception);
  //   }
  // }
}

ApiSubreddit subreddit = ApiSubreddit();

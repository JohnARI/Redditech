import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:redditech/services/api_client.dart';

class ApiSubreddit {
  Future<bool> test() async {
    try {
      Redditor? me = await api.reddit?.user.me();
      print(me);
      return true;
    } catch (exception) {
      print("bonjour");
      print(exception);
      return false;
    }
  }

  Future<List<Subreddit>> getMySubreddits() async {
    try {
      Stream<Subreddit> subReddits = api.reddit!.user.subreddits();
      List<Subreddit> listSubReddits = [];

      await for (Subreddit subReddit in subReddits) {
        print(
            "=====================================================================================================");
        print(subReddit);
        // banner_image
        listSubReddits.add(subReddit);
      }

      return listSubReddits;
    } catch (exception) {
      print(exception);
      return List<Subreddit>.empty();
    }
  }

  Future<List<SubredditRef>> searchSubreddit(String query) async {
    try {
      Stream<SubredditRef>? mySearch =
          api.reddit!.subreddits.search(query, limit: 25);
      List<SubredditRef> listSubReddits = [];

      await for (SubredditRef subreddit in mySearch) {
        listSubReddits.add(subreddit);
      }
      return listSubReddits;
    } catch (exception) {
      return List<Subreddit>.empty();
    }
  }
}

ApiSubreddit subreddit = ApiSubreddit();

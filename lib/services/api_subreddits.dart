import 'dart:async';
import 'dart:convert';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  Future<List<Subreddit>> searchByNameInMySubreddit(
      String subredditName) async {
    try {
      Stream<Subreddit> subReddits = api.reddit!.user.subreddits();
      List<Subreddit> listSubReddits = [];

      await for (Subreddit subReddit in subReddits) {
        if (subReddit.displayName == subredditName) {
          listSubReddits.add(subReddit);
        }
      }

      return listSubReddits;
    } catch (exception) {
      return List<Subreddit>.empty();
    }
  }

  Future<bool> join(String subredditName) async {
    try {
      List<Subreddit> inMySubreddit =
          await searchByNameInMySubreddit(subredditName);

      if (inMySubreddit.isNotEmpty) {
        await inMySubreddit[0].unsubscribe();

        return true;
      }

      return false;
    } catch (exception) {
      print(exception);
      return false;
    }
  }

  Future<bool> leave(String subredditName) async {
    try {
      // http.Response test = await api.reddit?.get('/api/v1/me/prefs');
      // dynamic test = await api.reddit
      //     ?.post('/api/subscribe', {"action:": "sub", "sr_name": "paris"});
      // print(test.body);

      dynamic test = await api.reddit?.get("/api/v1/me/prefs");

      // http.Response test = await api.reddit?.get('/api/v1/me/prefs');
      // api.reddit?.put('/api/v1/me/prefs', body: {"threaded_messages": "true"});
      print(test);
      return true;
    } catch (exception) {
      print(exception);
      return false;
    }
  }

  Future<bool> getPostsFromSubreddit(String subredditName) async {
    try {
      List<SubredditRef> subreddits =
          await api.reddit!.subreddits.searchByName(subredditName);
      return true;
    } catch (exception) {
      print(exception);
      return false;
    }
  }
}

ApiSubreddit subreddit = ApiSubreddit();

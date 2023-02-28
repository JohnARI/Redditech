import 'dart:async';
import 'package:draw/draw.dart';
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

  Future<void> getSubredditInfo() async {
    try {
      List<Subreddit>? mySubreddits = await getMySubreddits();
      mySubreddits?.forEach((element) => {print(element.title)});
    } catch (exception) {}
  }
}

ApiSubreddit subreddit = ApiSubreddit();

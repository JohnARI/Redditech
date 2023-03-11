import 'dart:async';
import 'dart:convert';
import 'package:draw/draw.dart';
import 'package:redditech/services/api_client.dart';

class ApiSubreddit {
  Future<bool> test() async {
    try {
      Redditor? me = await api.reddit?.user.me();
      return true;
    } catch (exception) {
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

  Future<List<Subreddit>> searchSubreddit(String query) async {
    try {
      Stream<SubredditRef>? mySearch =
          api.reddit!.subreddits.search(query, limit: 25);
      List<Subreddit> listSubReddits = [];

      await for (SubredditRef subreddit in mySearch) {
        listSubReddits.add(await subreddit.populate());
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

  Future<bool> leave(String subredditName) async {
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

  Future<bool> join(String subredditName) async {
    try {
      List<SubredditRef>? target =
          await api.reddit?.subreddits.searchByName(subredditName);
      if (target!.isNotEmpty) {
        target[0].subscribe();
        return true;
      }
      return false;
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

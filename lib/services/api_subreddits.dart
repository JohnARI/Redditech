import 'dart:async';
import 'package:draw/draw.dart';
import 'package:redditech/services/api_client.dart';

class ApiSubreddit {
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

  /// subreddit - From which subreddit you want to get your posts.
  ///
  /// filter - What kind of filter you want to apply. 3 availaible filters:
  /// - top
  /// - latest
  /// - popular
  Future<List<UserContent>> getSubredditPostsFiltered(
      Subreddit subreddit, String filter) async {
    switch (filter) {
      case "top":
        return await convertStreamToList(subreddit.top(limit: 10));
      case "latest":
        return await convertStreamToList(subreddit.newest(limit: 10));
      case "popular":
        return await convertStreamToList(subreddit.hot(limit: 10));
      default:
        return List<UserContent>.empty();
    }
  }

  Future<List<UserContent>> convertStreamToList(
      Stream<UserContent> stream) async {
    List<UserContent> listUserContent = [];
    await for (UserContent userContent in stream) {
      listUserContent.add(userContent);
    }

    return listUserContent;
  }
}

ApiSubreddit subreddit = ApiSubreddit();

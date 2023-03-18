import 'dart:async';
import 'dart:convert';
import 'package:draw/draw.dart';
import 'package:redditech/services/api_client.dart';

import '../models/subreddit.dart';

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
          api.reddit!.subreddits.search(query, limit: 10);
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
  Future<List<SubredditPost>> getSubredditPostsFiltered(
      Subreddit subreddit, String filter) async {
    switch (filter) {
      case "top":
        return await convertStreamToList(subreddit.top(limit: 10));
      case "latest":
        return await convertStreamToList(subreddit.newest(limit: 10));
      case "popular":
        return await convertStreamToList(subreddit.hot(limit: 10));
      default:
        return List<SubredditPost>.empty();
    }
  }

  Future<List<SubredditPost>> convertStreamToList(
      Stream<UserContent> stream) async {
    List<SubredditPost> dataList = [];

    await for (UserContent userContent in stream) {
      SubredditPost data = SubredditPost();
      data.userContent = userContent;

      final Map<String, dynamic> userContentJson =
          jsonDecode(data.userContent.toString());

      Redditor? author;
      author = await getRedditor(userContentJson['author']);
      if (author != null) {
        data.redditor = author;
      }

      final Map<String, dynamic> authorJson =
          jsonDecode(data.redditor.toString());
      data.redditorProfileImgUrl =
          authorJson['icon_img'].replaceAll("&amp;", "&");

      dataList.add(data);
    }

    return dataList;
  }

  Future<Redditor?> getRedditor(String username) async {
    try {
      RedditorRef? author = api.reddit?.redditor(username);

      Redditor? redditor = await author?.populate();

      return redditor!;
    } catch (exception) {
      print(exception);
      return Future<Redditor?>.value(null);
    }
  }
}

ApiSubreddit subreddit = ApiSubreddit();

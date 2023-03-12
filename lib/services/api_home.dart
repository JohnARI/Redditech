import 'dart:async';
import 'package:draw/draw.dart';
import 'package:redditech/services/api_client.dart';

class ApiHome {
  Future<Stream<UserContent>?> getPopular() async {
    try {
      Stream<UserContent>? popular = api.reddit?.front.hot(limit: 10);

      return popular;
    } catch (exception) {
      print(exception);
      return Future<Stream<UserContent>?>.value(null);
    }
  }

  Future<Stream<UserContent>?> getTop() async {
    try {
      Stream<UserContent>? popular = api.reddit?.front.top(limit: 10);

      return popular;
    } catch (exception) {
      print(exception);
      return Future<Stream<UserContent>?>.value(null);
    }
  }

  Future<Stream<UserContent>?> getLatest() async {
    try {
      Stream<UserContent>? popular = api.reddit?.front.newest(limit: 10);

      return popular;
    } catch (exception) {
      print(exception);
      return Future<Stream<UserContent>?>.value(null);
    }
  }

  Future<Redditor?> getRedditor(String username) async {
    try {
      RedditorRef? author = await api.reddit?.redditor(username);

      Redditor? redditor = await author?.populate();

      return redditor!;
    } catch (exception) {
      print(exception);
      return Future<Redditor?>.value(null);
    }
  }
}

ApiHome home = ApiHome();

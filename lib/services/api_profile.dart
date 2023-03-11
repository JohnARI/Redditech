import 'dart:async';
import 'package:draw/draw.dart';
import 'package:redditech/services/api_client.dart';

class ApiProfile {
  Future<Redditor?> getProfile() async {
    try {
      Redditor? me = await api.reddit?.user.me();
      return me;
    } catch (exception) {
      print(exception);
      return Future<Redditor?>.value(null);
    }
  }

  Future<dynamic> getPrefs() async {
    try {
      dynamic prefs =
          await api.reddit?.get('/api/v1/me/prefs', objectify: false);
      // print(prefs);
      return prefs;
    } catch (exception) {
      print(exception);
      return Future<dynamic>.value(null);
    }
  }

  dynamic getNightmode() async {
    try {
      dynamic prefs =
          await api.reddit?.get('/api/v1/me/prefs', objectify: false);
      return prefs['nightmode'];
    } catch (exception) {
      print(exception);
      return false;
    }
  }
}

ApiProfile profile = ApiProfile();

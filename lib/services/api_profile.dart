import 'dart:async';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  void setProfileDisplayName(String displayName) async {
    try {
      Redditor? me = await api.reddit?.user.me();
    } catch (exception) {
      print(exception);
    }
  }

  Future<Response> getPrefs() {
    try {
      Map<String, String> out = {};

      Future<Response> prefs = api.get('/api/v1/me/prefs', out);

      return prefs;
    } catch (exception) {
      print(exception);
      return Future<Response>.value(null);
    }
  }
}

ApiProfile profile = ApiProfile();

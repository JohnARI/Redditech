import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/profile/header.dart';
import 'package:redditech/components/profile/settings.dart';
import 'package:redditech/services/api_profile.dart';
import 'package:http/http.dart' as http;

import 'package:draw/draw.dart';
import '../../common/const.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<Redditor?> redditorProfile;

  @override
  void initState() {
    super.initState();
    redditorProfile = profile.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: MediaQuery.of(context).size.height - 56,
        color: Colors.white,
        child: FutureBuilder<Redditor?>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                final Map<String, dynamic> data = jsonDecode(items.toString());

                final String name = data['name'];
                final String displayName = data['subreddit']['title'];
                final String profileSrc = data['icon_img'];
                final String bannerSrc = data['subreddit']['banner_img'];
                final String bio = data['subreddit']['public_description'];
                final int followersCount = data['subreddit']['subscribers'];
                final int karmaCount = data['total_karma'];

                String profileSrcFixed =
                    profileSrc.substring(0, profileSrc.indexOf('?'));
                String bannerSrcFixed =
                    bannerSrc.substring(0, bannerSrc.indexOf('?'));

                return Column(children: [
                  // Text(items.toString()),
                  Header(
                      bannerSrc: bannerSrcFixed,
                      profileSrc: profileSrcFixed,
                      username: name,
                      bio: bio,
                      followersCount: followersCount,
                      karmaCount: karmaCount),
                  const Divider(color: neutralMedium3, thickness: 2.0),
                  Settings(settings: [
                    {
                      'value': displayName,
                      'name': 'Display name',
                      'type': 'text'
                    },
                    {
                      'value': bio,
                      'name': 'Public description',
                      'type': 'text'
                    },
                    {'value': "www", 'name': 'Email', 'type': 'text'},
                    {
                      'value': "Male",
                      'name': 'Gender',
                      'type': 'select',
                      'options': const ['Male', 'Female', 'Other']
                    },
                  ])
                ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
            future: redditorProfile),
      ),
    );
  }
}

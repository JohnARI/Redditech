import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/loader.dart';
import 'package:redditech/components/profile/header.dart';
import 'package:draw/draw.dart';
import 'package:redditech/services/api_profile.dart';
import 'package:redditech/components/profile/settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<Redditor?> userProfile;
  late Future<dynamic> userPrefs;

  @override
  void initState() {
    super.initState();
    userProfile = profile.getProfile();
    userPrefs = profile.getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 56,
        color: Colors.white,
        child: Column(
          children: [
            FutureBuilder<Redditor?>(
              future: userProfile,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return const Loader();
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                }

                final items = snapshot.data!;
                final Map<String, dynamic> data = jsonDecode(items.toString());

                final String name = data['name'];
                final String profileSrc = data['icon_img'];
                final String bannerSrc = data['subreddit']['banner_img'];
                final String bio = data['subreddit']['public_description'];
                final int followersCount = data['subreddit']['subscribers'];
                final int karmaCount = data['total_karma'];

                String profileSrcFixed = profileSrc.replaceAll("&amp;", "&");
                String bannerSrcFixed = bannerSrc.replaceAll("&amp;", "&");

                return Header(
                    bannerSrc: bannerSrcFixed,
                    profileSrc: profileSrcFixed,
                    username: name,
                    bio: bio,
                    followersCount: followersCount,
                    karmaCount: karmaCount);
              },
            ),
            const Divider(color: neutralMedium3, thickness: 2.0),
            FutureBuilder<dynamic>(
                future: userPrefs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Error'));
                  }

                  final items = snapshot.data!;

                  return Settings(settings: items);
                })
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:redditech/components/loader.dart';
import 'package:redditech/components/subreddit_list.dart';
import 'package:redditech/screens/community/community_info_screen.dart';
import 'package:redditech/services/api_subreddits.dart';
import 'package:draw/draw.dart';

import '../../common/const.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  late Future<List<Subreddit>> mySubreddits;
  @override
  void initState() {
    super.initState();
    mySubreddits = subreddit.getMySubreddits();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 20, bottom: 0), // 59 if search bar is present, 0 if not
      decoration: containerBorder,
      child: FutureBuilder<List<Subreddit>>(
        future: mySubreddits,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                final Map<String, dynamic> data = jsonDecode(item.toString());
                final int subscribers = data['subscribers'];
                final String iconImg = data['icon_img'];
                final String description = data['public_description'];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityInfoScreen(
                          mySubreddits: snapshot.data,
                          subredditTitle: item.title,
                          subredditName: item.displayName,
                          numberOfMembers: subscribers,
                          iconImg: iconImg,
                          subredditDescription: description,
                          subreddit: item,
                        ),
                      ),
                    );
                  },
                  child: SubredditList(
                      subredditName: item.displayName,
                      numberOfMembers: subscribers.toString(),
                      bottomPadding: 0,
                      iconImg: item.iconImage.toString()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return Container(
                decoration: containerBorder,
                child: const Loader());
          }
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:redditech/components/subreddit_list.dart';
import 'package:redditech/models/subreddit.dart';
import 'package:redditech/screens/communities/community_info_screen.dart';
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
      // child: ListView.builder(
      //   itemCount: subredditsModel.length,
      //   itemBuilder: (context, index) {
      //     return GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => CommunityInfoScreen(
      //               subredditName: subredditsModel[index].subredditName,
      //               subredditDescription: subredditsModel[index].subredditDescription,
      //               numberOfMembers: subredditsModel[index].numberOfMembers,
      //               numberOfOnlineMembers: 1000,
      //               numberOfUpVotes: 1000,
      //               numberOfDownVotes: 1000,
      //               numberOfComments: 1000,
      //               iconImg: '',
      //             ),
      //           ),
      //         );
      //       },
      //       child: SubredditList(
      //           subredditName: subredditsModel[index].subredditName,
      //           numberOfMembers: subredditsModel[index].numberOfMembers.toString(),
      //           bottomPadding: 0,
      //           iconImg: ''),
      //     );
      //   },
      // ),
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
                          subredditTitle: item.title,
                          subredditName: item.displayName,
                          numberOfMembers: subscribers,
                          iconImg: iconImg,
                          subredditDescription: description,
                        ),
                      ),
                    );

                    //             final int subscribers = data['subscribers'];
                    // final String iconImg = data['icon_img'];

                    // return GestureDetector(
                    //   onTap: () {
                    //     print(item.displayName);
                    //   },
                    //   child: SubredditList(
                    //       subredditName: item.displayName,
                    //       numberOfMembers: subscribers.toString(),
                    //       bottomPadding: 0,
                    //       iconImg: iconImg),
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
                child: const Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:redditech/components/search_bar.dart';
import 'package:redditech/components/subreddit_list.dart';
import 'package:draw/draw.dart';
import 'package:redditech/services/api_subreddits.dart';
import '../../common/const.dart';
import '../community/community_info_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Subreddit>> searchSubreddit;
  late TextEditingController textEditingController = TextEditingController();
  late String inputQuery = "";

  @override
  void initState() {
    super.initState();
    searchSubreddit = subreddit.searchSubreddit("");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.only(
            top: 20, bottom: 59), // 59 if search bar is present, 0 if not
        decoration: containerBorder,
        child: FutureBuilder<List<Subreddit>>(
          future: searchSubreddit,
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
                  final String title = data['title'];
                  final String description = data['public_description'];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityInfoScreen(
                            mySubreddits: [item],
                            subredditTitle: title,
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
                        iconImg: iconImg),
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
      ),
      SearchBar(
          callback: (value) => {
                setState(() {
                  inputQuery = value;
                  searchSubreddit = subreddit.searchSubreddit(inputQuery);
                })
              }),
    ]);
  }
}

import 'dart:convert';

import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:redditech/components/loader.dart';
import 'package:redditech/components/post_preview.dart';
import 'package:redditech/services/api_subreddits.dart';

import '../../models/subreddit.dart';

class UpvotesScreen extends StatefulWidget {
  const UpvotesScreen(
      {super.key,
      required this.leftPadding,
      required this.rightPadding,
      required this.subreddit});
  final double leftPadding;
  final double rightPadding;
  final Subreddit subreddit;

  @override
  State<UpvotesScreen> createState() => _UpvotesScreenState();
}

class _UpvotesScreenState extends State<UpvotesScreen> {
  late List<SubredditPost> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => data = []);
    final res =
        await subreddit.getSubredditPostsFiltered(widget.subreddit, "top");
    setState(() => data = res);
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Loader();
    }
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final UserContent item = data[index].userContent;
        final Map<String, dynamic> itemJson = jsonDecode(item.toString());

        String preview =
            itemJson['preview']?['images'][0]['source']['url'] ?? '';
        String previewFixed = preview.replaceAll('&amp;', '&');

        return Column(
          children: [
            PostPreview(
              subreddit: itemJson['subreddit_name_prefixed'],
              username: 'u/' + itemJson['author'],
              title: itemJson['title'],
              profilePicture: data[index].redditorProfileImgUrl,
              image: previewFixed,
              url: itemJson['url'],
              timestamp: itemJson['created_utc'].round(),
              upVotes: itemJson['ups'],
              downVotes: 0,
              comments: 10,
              leftPadding: widget.leftPadding,
              rightPadding: widget.rightPadding,
            ),
          ],
        );
      },
    );
  }
}

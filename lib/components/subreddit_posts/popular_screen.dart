import 'dart:convert';

import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:redditech/components/post_preview.dart';

import '../../models/subreddit.dart';
import '../../services/api_subreddits.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen(
      {super.key,
      required this.leftPadding,
      required this.rightPadding,
      required this.subreddit});
  final double leftPadding;
  final double rightPadding;
  final Subreddit subreddit;

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  late List<SubredditPost> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => data = []);
    final res =
        await subreddit.getSubredditPostsFiltered(widget.subreddit, "popular");
    setState(() => data = res);
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final UserContent item = data[index].userContent;
        final Map<String, dynamic> itemJson = jsonDecode(item.toString());

        String preview =
            itemJson['preview']?['images'][0]['source']['url'] ?? '';
        String previewFixed = preview.replaceAll('&amp;', '&');

        print(data[index].redditorProfileImgUrl);

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

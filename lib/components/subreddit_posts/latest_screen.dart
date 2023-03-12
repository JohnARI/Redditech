import 'dart:convert';

import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:redditech/components/post_preview.dart';

import '../../services/api_subreddits.dart';

class LatestScreen extends StatefulWidget {
  const LatestScreen(
      {super.key,
      required this.leftPadding,
      required this.rightPadding,
      required this.subreddit});
  final double leftPadding;
  final double rightPadding;
  final Subreddit subreddit;

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  late List<UserContent> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => data = []);
    final res =
        await subreddit.getSubredditPostsFiltered(widget.subreddit, "latest");
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
        final UserContent item = data[index];
        final Map<String, dynamic> itemJson = jsonDecode(item.toString());

        print("=============================");
        print(itemJson);
        print("=============================");

        return Column(
          children: [
            PostPreview(
              subreddit: itemJson['subreddit_name_prefixed'],
              username: 'u/' + itemJson['author'],
              title: itemJson['title'],
              profilePicture: 'https://googleflutter.com/sample_image.jpg',
              image: 'https://googleflutter.com/sample_image.jpg',
              timestamp: 1620000000,
              upVotes: 100,
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
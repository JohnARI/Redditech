import 'package:flutter/material.dart';
import 'package:redditech/components/post_preview.dart';

class UpvotesScreen extends StatefulWidget {
  const UpvotesScreen(
      {super.key, required this.leftPadding, required this.rightPadding});
  final double leftPadding;
  final double rightPadding;

  @override
  State<UpvotesScreen> createState() => _UpvotesScreenState();
}

class _UpvotesScreenState extends State<UpvotesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            PostPreview(
              subreddit: 'r/FlutterDev',
              username: 'u/DEUX BEUH VEURRRR',
              title: 'Ludovic loves UpvotesScreen',
              profilePicture: 'https://googleflutter.com/sample_image.jpg',
              image: 'https://googleflutter.com/sample_image.jpg',
              timestamp: 1620000000,
              url: "",
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

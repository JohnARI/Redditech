import 'package:flutter/material.dart';
import 'package:redditech/components/post_preview.dart';

class LatestScreen extends StatefulWidget {
  const LatestScreen({super.key, required this.leftPadding, required this.rightPadding});
  final double leftPadding;
  final double rightPadding;

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
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
              title: 'Ludovic loves LatestScreen',
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

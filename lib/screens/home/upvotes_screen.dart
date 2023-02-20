import 'package:flutter/material.dart';
import 'package:redditech/components/post_preview.dart';

class UpvotesScreen extends StatefulWidget {
  const UpvotesScreen({super.key});

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
          children: const [
            PostPreview(
              subreddit: 'r/FlutterDev',
              username: 'u/DEUX BEUH VEURRRR',
              title: 'Ludovic loves UpvotesScreen',
              profilePicture: 'https://googleflutter.com/sample_image.jpg',
              image: 'https://googleflutter.com/sample_image.jpg',
              timestamp: 1620000000,
              upVotes: 100,
              downVotes: 0,
              comments: 10,
            ),
          ],
        );
      },
    );
  }
}
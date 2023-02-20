import 'package:flutter/material.dart';
import 'package:redditech/components/post_preview.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: const [
              PostPreview(
                subreddit: 'r/FlutterDev',
                username: 'u/FlutterDev',
                title: 'Ludovic loves Flutter',
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
      ),
    );
  }
}

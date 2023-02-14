import 'package:flutter/material.dart';
import 'package:redditech/components/bottom_navbar.dart';
import 'package:redditech/components/postPreview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            PostPreview(
              subreddit: 'r/FlutterDev',
              username: 'u/FlutterDev',
              title: 'Fuck flutter',
              profilePicture: 'https://googleflutter.com/sample_image.jpg',
              image: 'https://googleflutter.com/sample_image.jpg',
              timestamp: 1620000000,
              upVotes: 100,
              downVotes: 0,
              comments: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}

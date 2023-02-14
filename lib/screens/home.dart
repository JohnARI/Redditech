import 'package:flutter/material.dart';
import 'package:redditech/components/bottom_navbar.dart';
import 'package:redditech/components/appbar.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/postPreview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onSelectedIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAppbar(
          title: 'home',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // screens[_selectedIndex]

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
          )),
      bottomNavigationBar: BottomNavbar(
        onSelectedIndexChanged: _onSelectedIndexChanged,
      ),
    );
  }
}

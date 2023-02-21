import 'package:flutter/material.dart';
import 'package:redditech/components/bottom_navbar.dart';
import 'package:redditech/components/appbar.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/screens/profile/profile.dart';
import 'package:redditech/screens/home/latest_screen.dart';
import 'package:redditech/screens/home/main_home_screen.dart';
import 'package:redditech/screens/home/popular_screen.dart';
import 'package:redditech/screens/home/upvotes_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;

  void _onSelectedIndexChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark3,
      appBar: _page == 4
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: MyAppbar(
                title: title[_page],
              ),
            ),
      body: filterScreens[_page],
      bottomNavigationBar: BottomNavbar(
        onSelectedIndexChanged: _onSelectedIndexChanged,
      ),
    );
  }
}

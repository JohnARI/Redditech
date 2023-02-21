import 'package:flutter/material.dart';
import 'package:redditech/components/bottom_navbar.dart';
import 'package:redditech/components/appbar.dart';
import 'package:redditech/common/const.dart';

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
      appBar: _page == 4 // When the user is on the profile page, don't show the appbar
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: MyAppbar(
                title: title[_page], // Get the title from the const.dart file
              ),
            ),
      body: bottomNavbarScreens[_page], // Get the body from the const.dart file
      bottomNavigationBar: BottomNavbar(
        onSelectedIndexChanged: _onSelectedIndexChanged,
      ),
    );
  }
}

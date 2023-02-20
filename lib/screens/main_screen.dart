import 'package:flutter/material.dart';
import 'package:redditech/components/bottom_navbar.dart';
import 'package:redditech/components/appbar.dart';
import 'package:redditech/common/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onTabIndexChanged(int index) {
    setState(() {
      _selectedIndex = index + 4;
    });
  }
  void _onSelectedIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark3,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: MyAppbar(
          title: 'Home',
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            TabBar(
              controller: TabController(length: 3, vsync: this),
              indicatorColor: medium0,
              labelColor: medium0,
              unselectedLabelColor: Colors.grey,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
              onTap: (index) {
                _onTabIndexChanged(index);
                print(_selectedIndex);
              },
              tabs: const [
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Latest',
                ),
                Tab(
                  text: 'Upvotes',
                ),
              ],
            ),
            screens[_selectedIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        onSelectedIndexChanged: _onSelectedIndexChanged,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/screens/home/latest_screen.dart';
import 'package:redditech/screens/home/popular_screen.dart';
import 'package:redditech/screens/home/upvotes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Container(
        decoration: containerBorder,
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              indicatorColor: medium0,
              labelColor: medium0,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
              unselectedLabelColor: Colors.grey,
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
            Expanded(
              flex: 3,
              child: TabBarView(
                controller: tabController,
                children: const [
                  PopularScreen(),
                  LatestScreen(),
                  UpvotesScreen(),
                ],
              ),
            ),
          ],
        ),
      );
  }
}

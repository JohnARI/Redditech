import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, -1.5),
          ),
        ],
      ),
      child: TabBar(
        splashBorderRadius: BorderRadius.circular(15),
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
    );
  }
}

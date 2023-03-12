import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/subreddit_posts/popular_screen.dart';
import 'package:redditech/components/subreddit_posts/upvotes_screen.dart';
import 'package:redditech/components/subreddit_posts/latest_screen.dart';
import 'package:redditech/components/tabbar.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key, required this.subreddit}) : super(key: key);

  final Subreddit subreddit;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Container(
      decoration: containerBorder,
      child: Column(
        children: [
          MyTabBar(tabController: tabController),
          Expanded(
            flex: 3,
            child: TabBarView(
              controller: tabController,
              children: [
                PopularScreen(
                  leftPadding: 24.0,
                  rightPadding: 24.0,
                  subreddit: widget.subreddit,
                ),
                LatestScreen(
                  leftPadding: 24.0,
                  rightPadding: 24.0,
                  subreddit: widget.subreddit,
                ),
                UpvotesScreen(
                  leftPadding: 24.0,
                  rightPadding: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

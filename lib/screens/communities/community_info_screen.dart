import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/appbar_background_img.dart';
import 'package:redditech/components/overflow_img.dart';
import 'package:redditech/components/subreddit_description.dart';
import 'package:redditech/screens/home/latest_screen.dart';
import 'package:redditech/screens/home/popular_screen.dart';
import 'package:redditech/screens/home/upvotes_screen.dart';

class CommunityInfoScreen extends StatefulWidget {
  const CommunityInfoScreen(
      {super.key,
      required this.subredditName,
      required this.subredditTitle,
      required this.subredditDescription,
      required this.numberOfMembers,
      required this.iconImg});

  final String subredditName, iconImg, subredditDescription, subredditTitle;
  final int numberOfMembers;

  @override
  State<CommunityInfoScreen> createState() => _CommunityInfoScreenState();
}

class _CommunityInfoScreenState extends State<CommunityInfoScreen>
    with TickerProviderStateMixin {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Stack(
        children: [
          AppbarBackgroundImg(
              subredditName: 'r/${widget.subredditName}',
              backgroundImg: "https://source.unsplash.com/random"),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Container(
              decoration: containerBorder,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 71.0, bottom: 16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.numberOfMembers} members",
                                style: const TextStyle(
                                  color: medium0,
                                ),
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                    minWidth: 100, maxWidth: 210),
                                child: Text(
                                  widget.subredditTitle,
                                  style: const TextStyle(
                                    color: medium0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: const BorderSide(color: medium0),
                                ),
                              ),
                            ),
                            child: const Text("Join",
                                style: TextStyle(color: medium0)),
                          ),
                        ],
                      ),
                    ),
                    SubredditDescription(
                      subredditDescription: widget.subredditDescription,
                      showMore: _showMore,
                      showMoreCallback: () {
                        setState(() {
                          _showMore = !_showMore;
                        });
                      },
                    ),
                    TabBar(
                      controller: tabController,
                      indicatorColor: medium0,
                      labelColor: medium0,
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
                          PopularScreen(
                            leftPadding: 0.0,
                            rightPadding: 0.0,
                          ),
                          LatestScreen(
                            leftPadding: 0.0,
                            rightPadding: 0.0,
                          ),
                          UpvotesScreen(
                            leftPadding: 0.0,
                            rightPadding: 0.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          (() {
            if (widget.iconImg.isNotEmpty) {
              return OverflowImg(
                  backgroundImg: Image.network(
                widget.iconImg,
                height: 64.0,
                width: 64.0,
                fit: BoxFit.cover,
              ));
            }
            return OverflowImg(
              backgroundImg: Image.asset(
                'assets/images/giga_chad.jpg',
                height: 64.0,
                width: 64.0,
                fit: BoxFit.cover,
              ),
            );
          }()),
        ],
      ),
    );
  }
}

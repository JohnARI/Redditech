import 'package:flutter/material.dart';
import 'package:redditech/components/subreddit_list.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return const SubredditList(
        subredditName: 'r/ChaseAfterYourDreams',
        community: 'Community',
        numberOfMembers: '19504',
        bottomPadding: 0);
  }
}

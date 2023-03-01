import 'package:flutter/material.dart';
import 'package:redditech/components/search_bar.dart';
import 'package:redditech/components/subreddit_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        SubredditList(
          subredditName: 'r/ChaseAfterYourDreams',
          numberOfMembers: '19504',
          bottomPadding: 59,
          iconImg: "",
        ),
        SearchBar(),
      ],
    );
  }
}

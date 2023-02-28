import 'package:flutter/material.dart';
import 'package:redditech/components/search_bar.dart';
import 'package:redditech/components/subreddit_list.dart';
import 'package:redditech/models/subreddit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SubredditList(
          subreddits: subreddits,
          bottomPadding: 59,
          iconImg: "",
        ),
        const SearchBar(),
      ],
    );
  }
}

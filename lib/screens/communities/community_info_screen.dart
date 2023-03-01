import 'package:flutter/material.dart';

class CommunityInfoScreen extends StatefulWidget {
  const CommunityInfoScreen({
    super.key,
    required this.subredditName,
    required this.numberOfMembers,
    required this.numberOfUpVotes,
    required this.numberOfDownVotes,
    required this.numberOfComments,
    required this.iconImg
  });

  final String subredditName, iconImg;
  final int numberOfMembers, numberOfUpVotes, numberOfDownVotes, numberOfComments;

  @override
  State<CommunityInfoScreen> createState() => _CommunityInfoScreenState();
}

class _CommunityInfoScreenState extends State<CommunityInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            backgroundColor: Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://source.unsplash.com/random",
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "r/${widget.subredditName}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            leading: Center(
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // Add your content here
            ),
          ),
        ],
      ),
    );
  }
}

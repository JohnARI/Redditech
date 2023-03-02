import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class CommunityInfoScreen extends StatefulWidget {
  const CommunityInfoScreen(
      {super.key,
      required this.subredditName,
      required this.numberOfMembers,
      required this.numberOfUpVotes,
      required this.numberOfDownVotes,
      required this.numberOfComments,
      required this.iconImg});

  final String subredditName, iconImg;
  final int numberOfMembers,
      numberOfUpVotes,
      numberOfDownVotes,
      numberOfComments;

  @override
  State<CommunityInfoScreen> createState() => _CommunityInfoScreenState();
}

class _CommunityInfoScreenState extends State<CommunityInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 130,
            child: CustomScrollView(
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
                    title: Text(
                      "r/${widget.subredditName}"
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Container(
              decoration: containerBorder,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(widget.iconImg),
                    ),
                    title: Text("r/${widget.subredditName}"),
                    subtitle: const Text("Community"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("${widget.numberOfMembers}"),
                            const Text("Members"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("${widget.numberOfUpVotes}"),
                            const Text("Upvotes"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("${widget.numberOfDownVotes}"),
                            const Text("Downvotes"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("${widget.numberOfComments}"),
                            const Text("Comments"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

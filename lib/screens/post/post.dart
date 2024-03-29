import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/appbar_background_img.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    super.key,
    required this.subreddit,
    required this.username,
    required this.title,
    required this.profilePicture,
    required this.image,
    required this.timestamp,
    required this.upVotes,
    required this.downVotes,
    required this.comments,
  });

  final String subreddit;
  final String username;
  final String title;
  final String profilePicture;
  final String image;
  final int timestamp;
  final int upVotes;
  final int downVotes;
  final int comments;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return AppbarBackgroundImg(
        subredditName: widget.subreddit,
        backgroundImg: SafeArea(
          child: SvgPicture.asset(
            "assets/images/logos/logo_dark.svg",
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            color: medium0.withOpacity(0.3),
          ),
        ),
        pageBody: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          left: 71.0, bottom: 16.0, top: 16),
                      child: Text(widget.username,
                          style: const TextStyle(
                            color: medium0,
                          ))),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Text(widget.title,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600)),
                  ),
                  Image.network(widget.image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.keyboard_arrow_up,
                            color: neutralDark2),
                        const SizedBox(width: 4),
                        Text(widget.upVotes.toString()),
                        const SizedBox(width: 16),
                        const Icon(Icons.keyboard_arrow_down,
                            color: neutralDark2),
                        const Spacer(),
                        const Icon(Icons.chat_bubble_outline,
                            color: neutralDark2),
                        const SizedBox(width: 4),
                        Text(widget.comments.toString()),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        color: light1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundImage:
                                        NetworkImage(widget.profilePicture),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: const [
                                        Text(
                                          'u/username •',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '1h',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ])
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                children: const [
                                  Flexible(
                                    child: Text(
                                      'TESTqsdqsdsazeazeazezaezaeazeazezaeazezaeazeqdqsdqsdqsdqsdqsdqs',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                children: const [
                                  Icon(Icons.keyboard_arrow_up,
                                      color: neutralDark2),
                                  SizedBox(width: 4),
                                  Text('1'),
                                  SizedBox(width: 16),
                                  Icon(Icons.keyboard_arrow_down,
                                      color: neutralDark2),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )),
        ),
        overflowImg: Image.network(
          "https://source.unsplash.com/random",
          height: 64.0,
          width: 64.0,
          fit: BoxFit.cover,
        ));
  }
}

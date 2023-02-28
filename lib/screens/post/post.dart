import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/components/post/header.dart';

import '../../common/const.dart';
import '../../components/appbar.dart';

class PostPage extends StatefulWidget {
  const PostPage(
      {super.key,
      required this.subreddit,
      required this.username,
      required this.title,
      required this.profilePicture,
      required this.image,
      required this.timestamp,
      required this.upVotes,
      required this.downVotes,
      required this.comments});

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
    return Container(
        color: dark3,
        child: Column(
          children: [
            Header(
                profileSrc: widget.profilePicture,
                username: widget.username,
                title: widget.title),
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  Image.network('https://picsum.photos/1920/1080'),
                  Row(children: [
                    Row(
                      children: [
                        const Icon(Icons.keyboard_arrow_up,
                            color: neutralDark2),
                        Text(widget.upVotes.toString(),
                            style: const TextStyle(
                                fontFamily: "IBM Plex Sans Regular",
                                color: neutralDark2,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w700,
                                fontSize: 14)),
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: neutralDark2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.chat_bubble_outline,
                            color: neutralDark2),
                        const SizedBox(width: 4),
                        Text(widget.comments.toString(),
                            style: const TextStyle(
                                fontFamily: "IBM Plex Sans Regular",
                                color: neutralDark2,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w700,
                                fontSize: 14)),
                      ],
                    ),
                  ]),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: neutralMedium3,
                    child: Text(
                      'Posted by u/' + widget.username,
                      style: const TextStyle(
                          fontFamily: "IBM Plex Sans Regular",
                          color: neutralDark2,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ));
  }
}

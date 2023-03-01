import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:intl/intl.dart';
import 'package:redditech/screens/post/post.dart';

class PostPreview extends StatefulWidget {
  const PostPreview(
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
  State<PostPreview> createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {
  final df = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostPage(
            subreddit: widget.subreddit,
            username: widget.username,
            title: widget.title,
            profilePicture: widget.profilePicture,
            image: widget.image,
            timestamp: widget.timestamp,
            upVotes: widget.upVotes,
            downVotes: widget.downVotes,
            comments: widget.comments,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg')),
                const SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(widget.subreddit,
                            style: const TextStyle(
                                color: medium0,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                        const Text(
                          ' • ',
                          style: TextStyle(
                              color: medium0,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                            df.format(DateTime.fromMillisecondsSinceEpoch(
                                    widget.timestamp * 1000)
                                .toUtc()),
                            style: const TextStyle(
                                color: medium0,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(widget.username,
                        style: const TextStyle(
                            color: medium0,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 16.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 19.2,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Image.network(widget.image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 24, right: 24, bottom: 16, top: 16),
            child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Row(
                children: [
                  const Icon(Icons.keyboard_arrow_up, color: neutralDark2),
                  const SizedBox(width: 4),
                  Text(widget.upVotes.toString()),
                ],
              ),
              const SizedBox(width: 16),
              // Row(
              //   children: [
              //     const Icon(Icons.keyboard_arrow_down, color: neutralDark2),
              //     const SizedBox(width: 4),
              //     Text(downVotes.toString()),
              //   ],
              // ),
              const Icon(Icons.keyboard_arrow_down, color: neutralDark2),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.chat_bubble_outline,
                        color: neutralDark2),
                    const SizedBox(width: 4),
                    Text(widget.comments.toString()),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
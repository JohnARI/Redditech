import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/common/const.dart';

class PostPreview extends StatefulWidget {
  const PostPreview({super.key});

  @override
  State<PostPreview> createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {
  String subreddit = 'r/FlutterDev';
  String username = 'u/Redditech';
  String title = 'Flutter is awesome!';
  String profilePicture = 'https://googleflutter.com/sample_image.jpg';
  String image = 'https://googleflutter.com/sample_image.jpg';
  int upVotes = 100;
  int downVotes = 10;
  int comments = 10;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg')),
                  SizedBox(width: 16),
                  Column(
                    children: <Widget>[
                      Text(subreddit, style: TextStyle(color: medium0)),
                      SizedBox(height: 4),
                      Text(username, style: TextStyle(color: medium0)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: Text(title),
                  ),
                ],
              ),
            ),
            Image.network(image),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 16),
              child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: neutralDark2),
                    SizedBox(width: 4),
                    Text(upVotes.toString()),
                  ],
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    Icon(Icons.thumb_down, color: neutralDark2),
                    SizedBox(width: 4),
                    Text(downVotes.toString()),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.mode_comment, color: neutralDark2),
                      SizedBox(width: 4),
                      Text(comments.toString()),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

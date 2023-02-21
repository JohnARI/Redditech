import 'package:flutter/material.dart';
import 'package:redditech/components/post/form.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: AddPostForm(form: [
          {'value': '', 'name': 'Title', 'type': 'text', 'maxLines': 1},
          {'value': '', 'name': 'Content', 'type': 'text', 'maxLines': 10},
          {
            'value': '',
            'name': 'Subreddit',
            'type': 'select',
            'options': ['r/idk', 'r/heheheha', 'r/ARRRRR ISS TOZZZ AAHH']
          },
        ]),
      ),
    );
  }
}

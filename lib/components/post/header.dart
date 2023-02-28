import 'package:flutter/material.dart';
import 'package:redditech/components/post/header_top.dart';
import 'package:redditech/components/post/header_bottom.dart';

class Header extends StatefulWidget {
  const Header(
      {super.key,
      required this.profileSrc,
      required this.username,
      required this.title});

  final String profileSrc;
  final String username;
  final String title;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HeaderTop(profileSrc: widget.profileSrc, username: widget.username),
      HeaderBottom(title: widget.title),
    ]);
  }
}

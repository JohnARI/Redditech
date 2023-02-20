import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/profile/header_top.dart';
import 'package:redditech/components/profile/header_bottom.dart';

class Header extends StatefulWidget {
  const Header(
      {super.key,
      required this.bannerSrc,
      required this.profileSrc,
      required this.username,
      required this.bio,
      required this.followersCount,
      required this.karmaCount});

  final String bannerSrc;
  final String profileSrc;
  final String username;
  final String bio;
  final int followersCount;
  final int karmaCount;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HeaderTop(
          bannerSrc: widget.bannerSrc,
          profileSrc: widget.profileSrc,
          username: widget.username,
          followersCount: widget.followersCount,
          karmaCount: widget.karmaCount),
      HeaderBottom(bio: widget.bio),
    ]);
  }
}

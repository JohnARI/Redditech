import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/profile/header.dart';

class Profile extends StatefulWidget {
  const Profile(
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
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
            bannerSrc: widget.bannerSrc,
            profileSrc: widget.profileSrc,
            username: widget.username,
            followersCount: widget.followersCount,
            karmaCount: widget.karmaCount),
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(widget.bio),
          ),
        ),
      ],
    );
  }
}

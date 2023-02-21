import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/components/profile/header.dart';
import 'package:redditech/components/profile/settings.dart';

class Profile extends StatefulWidget {
  const Profile(
      {super.key,
      required this.bannerSrc,
      required this.profileSrc,
      required this.username,
      required this.bio,
      required this.email,
      required this.gender,
      required this.followersCount,
      required this.karmaCount});

  final String bannerSrc;
  final String profileSrc;
  final String username;
  final String bio;
  final String email;
  final String gender;
  final int followersCount;
  final int karmaCount;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  get username => widget.username;
  get bio => widget.bio;
  get email => widget.email;
  get gender => widget.gender;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 56,
        color: Colors.white,
        child: Column(
          children: [
            Header(
                bannerSrc: widget.bannerSrc,
                profileSrc: widget.profileSrc,
                username: widget.username,
                bio: widget.bio,
                followersCount: widget.followersCount,
                karmaCount: widget.karmaCount),
            const Divider(color: neutralMedium3, thickness: 2.0),
            Settings(settings: [
              {'value': username, 'name': 'Username', 'type': 'text'},
              {'value': bio, 'name': 'Bio', 'type': 'text'},
              {'value': email, 'name': 'Email', 'type': 'text'},
              {
                'value': gender,
                'name': 'Gender',
                'type': 'select',
                'options': ['Male', 'Female', 'Other']
              },
            ]),
          ],
        ),
      ),
    );
  }
}

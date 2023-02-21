import 'package:flutter/material.dart';
import 'package:redditech/screens/home/latest_screen.dart';
import 'package:redditech/screens/home/main_home_screen.dart';
import 'package:redditech/screens/home/popular_screen.dart';
import 'package:redditech/screens/home/upvotes_screen.dart';
import 'package:redditech/screens/profile/profile.dart';
import 'package:redditech/screens/welcome/welcome.dart';

// Constants of colors

const dark0 = Color(0xff15072C);
const dark1 = Color(0xff2A0E58);
const dark2 = Color(0xff3F1584);
const dark3 = Color(0xff541CB0);
const medium0 = Color(0xff6C27DD);
const medium1 = Color(0xff874DE5);
const medium2 = Color(0xffA376EF);
const medium3 = Color(0xffC1A2F6);
const light0 = Color(0xffF6F1FE);
const light1 = Color(0xffFCFAFF);
const neutralDark0 = Color(0xff212529);
const neutralDark1 = Color(0xff343A40);
const neutralDark2 = Color(0xff495057);
const neutralDark3 = Color(0xff6C757D);
const neutralMedium0 = Color(0xffADB5BD);
const neutralMedium1 = Color(0xffCED4DA);
const neutralMedium2 = Color(0xffDEE2E6);
const neutralMedium3 = Color(0xffE9ECEF);
const neutralLight0 = Color(0xffF8F9FA);

const bottomNavbarScreens = [
  // PostPreview(
  //   subreddit: 'r/FlutterDev',
  //   username: 'u/FlutterDev',
  //   title: 'Fuck flutter',
  //   profilePicture: 'https://googleflutter.com/sample_image.jpg',
  //   image: 'https://googleflutter.com/sample_image.jpg',
  //   timestamp: 1620000000,
  //   upVotes: 100,
  //   downVotes: 0,
  //   comments: 10,
  // ),
  PopularScreen(),
  LatestScreen(),
  UpvotesScreen(),
  UpvotesScreen(),
  Profile(
    bannerSrc: "https://googleflutter.com/sample_image.jpg",
    profileSrc: "https://googleflutter.com/sample_image.jpg",
    username: "u/FlutterDev",
    bio:
        "I am a flutter developer and I love flutter and flutter is the best framework ever and I lov reatc native and I love flutter and flutter is the best framework ever and ",
    email: "ludovic@mail.com",
    gender: "Table",
    followersCount: 100,
    karmaCount: 1000,
  ),
  UpvotesScreen(),
  UpvotesScreen(),
  UpvotesScreen(),
];

final filterScreens = [
  const HomeScreen(),
  const HomeScreen(),
  const Welcome(),
  const HomeScreen(),
  Profile(
    bannerSrc: "https://googleflutter.com/sample_image.jpg",
    profileSrc: "https://googleflutter.com/sample_image.jpg",
    username: "u/FlutterDev",
    bio:
        "I am a flutter developer and I love flutter and flutter is the best framework ever and I lov reatc native and I love flutter and flutter is the best framework ever and ",
    email: "ludovic@mail.com",
    gender: "Male",
    followersCount: 100,
    karmaCount: 1000,
  ),
];

final title = [
  "Home",
  "Community",
  "Add",
  "Search",
];

import 'package:flutter/material.dart';
import 'package:redditech/screens/auth/auth.dart';
import 'package:redditech/screens/communities/main_community_screen.dart';
import 'package:redditech/screens/home/main_home_screen.dart';
import 'package:redditech/screens/search/main_search_screen.dart';

// Constants of colors
const dark0 = Color(0xff15072C);
const dark1 = Color(0xff2A0E58);
const dark2 = Color(0xff3F1584);
const dark3 = Color(0xff541CB0);
const medium0 = Color(0xff6C27DD);
const medium1 = Color(0xff874DE5);
const medium2 = Color(0xffA376EF);
const medium3 = Color(0xffD0B8FA);
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

// Border radius for containers under the appbar
const containerBorder = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  ),
);

// Screens displayed in the bottom navbar
final bottomNavbarScreens = [
  const HomeScreen(),
  const CommunityScreen(),
  const AuthScreen(),
  const SearchScreen(),
  const HomeScreen(),
];

// Titles displayed in the appbar
final title = [
  "Home",
  "My communities",
  "Add",
  "Search subbredit",
];

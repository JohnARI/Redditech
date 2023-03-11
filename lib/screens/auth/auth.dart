import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/services/api_client.dart';
import 'dart:async';

import '../../services/api_subreddits.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> with TickerProviderStateMixin {
  Future<bool> checkIsAuth() async {
    return await api.checkIsAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 182,
                child: CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0.0),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30.0),
                          child: const Text(
                            "Reddit client for Giga Chads",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      centerTitle: true,
                      expandedHeight: 182,
                      backgroundColor: dark3,
                      flexibleSpace: FlexibleSpaceBar(
                        background: AnimatedOpacity(
                            opacity: 0.1,
                            duration: const Duration(milliseconds: 0),
                            child: Image.asset('assets/images/giga_chad.jpg',
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () {
                        api.logout(context);
                      },
                      child: const Text("Logout")),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 29.0),
                    child: Text(
                        'Please, sign in with an account with the following service:'),
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: medium0,
                        elevation: 0,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 48, 49),
                      ),
                      onPressed: () async {
                        await api.authenticate(context);
                      },
                      icon: const Icon(Icons.reddit),
                      label: const Text("Sign in with Reddit"))
                ],
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 61,
            top: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logos/logo_dark.svg',
                  color: Colors.white,
                  height: 67,
                  width: 62,
                ),
                Text("RIEN",
                    style: GoogleFonts.yatraOne(
                        fontSize: 30, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

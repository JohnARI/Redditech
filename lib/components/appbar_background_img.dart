import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class AppbarBackgroundImg extends StatelessWidget {
  const AppbarBackgroundImg(
      {super.key,
      required this.subredditName,
      required this.backgroundImg,
      required this.pageBody,
      required this.overflowImg});
  final String subredditName;
  final Widget pageBody;
  final Widget overflowImg, backgroundImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 135,
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 120,
                  backgroundColor: dark3,
                  flexibleSpace: FlexibleSpaceBar(
                    background: backgroundImg,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        subredditName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Container(
              decoration: containerBorder,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: pageBody,
              ),
            ),
          ),
          Positioned(
            top: 100.0,
            left: 24.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: overflowImg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
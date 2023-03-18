import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:draw/draw.dart';
import 'package:lottie/lottie.dart';
import 'package:redditech/components/loader.dart';
import 'package:redditech/components/post_preview.dart';
import "package:redditech/services/api_home.dart";

class LatestScreen extends StatefulWidget {
  const LatestScreen(
      {super.key, required this.leftPadding, required this.rightPadding});
  final double leftPadding;
  final double rightPadding;

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  late Future<Stream<UserContent>?> popular;
  late Future<List<UserContent>> popularPosts;

  @override
  void initState() {
    super.initState();
    popular = home.getLatest();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: popular,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return const Loader();
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }

          final items = snapshot.data!;
          // List<UserContent> data = [];

          popularPosts = items.toList();

          return FutureBuilder(
            future: popularPosts,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return SizedBox(
                    height: MediaQuery.of(context).copyWith().size.height,
                    width: MediaQuery.of(context).copyWith().size.width,
                    child: const Loader());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              }

              final items = snapshot.data!;
              final List<dynamic> data = jsonDecode(items.toString());

              List<Future<Redditor?>> authors = [];

              for (int i = 0; i < data.length; i++) {
                authors.add(home.getRedditor(data[i]['author']));
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < data.length; i++)
                      FutureBuilder<Redditor?>(
                          future: authors[i],
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                !snapshot.hasData) {
                              return SizedBox(
                                  height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height,
                                  width: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .width,
                                  child: const Loader());
                            }

                            if (snapshot.hasError) {
                              return const Center(child: Text('Error'));
                            }

                            final items = snapshot.data!;
                            final Map<String, dynamic> author =
                                jsonDecode(items.toString());

                            final String profileSrcFixed =
                                author['icon_img'].replaceAll('&amp;', '&');
                            String preview = data[i]['preview']?['images'][0]
                                    ['source']['url'] ??
                                '';
                            String previewFixed =
                                preview.replaceAll('&amp;', '&');

                            return PostPreview(
                              subreddit: data[i]['subreddit'],
                              username: data[i]['author'],
                              title: data[i]['title'],
                              profilePicture: profileSrcFixed,
                              image: previewFixed,
                              url: data[i]['url'],
                              timestamp: data[i]['created_utc'].round(),
                              upVotes: data[i]['ups'],
                              downVotes: 0,
                              comments: 10,
                              leftPadding: widget.leftPadding,
                              rightPadding: widget.rightPadding,
                            );
                          }))
                  ],
                ),
              );
            }),
          );
        });
  }
}

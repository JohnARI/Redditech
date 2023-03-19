import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:redditech/components/loader.dart';
import 'package:redditech/components/post_preview.dart';
import "package:redditech/services/api_home.dart";
import 'package:draw/draw.dart';

class TopScreen extends StatefulWidget {
  const TopScreen(
      {super.key, required this.leftPadding, required this.rightPadding});
  final double leftPadding;
  final double rightPadding;

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  late Future<Stream<UserContent>?> popular;
  late Future<List<UserContent>> popularPosts;

  @override
  void initState() {
    super.initState();
    popular = home.getTop();
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

                            String profileSrc = author['icon_img'] ?? '';

                            String profileSrcFixed =
                                profileSrc.replaceAll('&amp;', '&');

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
                              downVotes: data[i]['downs'],
                              comments: data[i]['num_comments'],
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

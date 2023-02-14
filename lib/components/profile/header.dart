import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/common/const.dart';

class Header extends StatefulWidget {
  const Header(
      {super.key,
      required this.bannerSrc,
      required this.profileSrc,
      required this.username,
      required this.followersCount,
      required this.karmaCount});

  final String bannerSrc;
  final String profileSrc;
  final String username;
  final int followersCount;
  final int karmaCount;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 150.0,
              color: medium0,
              child: Image.network(widget.bannerSrc,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3),
            ),
            Container(
              alignment: Alignment.topRight,
              color: Colors.white,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 130.0, right: 24.0, top: 4.0, bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.username,
                          style: const TextStyle(
                              fontFamily: 'IBM Plex Sans Semibold',
                              color: neutralDark1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${widget.followersCount} followers • ${widget.karmaCount} karma',
                            style: const TextStyle(
                                fontFamily: 'IBM Plex Sans Regular',
                                color: medium0)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: 100.0, // (background container size) - (circle height / 2)
            left: 24, // (background container size) - (circle width / 2)
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.profileSrc,
                  height: 90.0,
                  width: 90.0,
                ),
              ),
            ))
      ],
    );
  }
}

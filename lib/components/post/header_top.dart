import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditech/common/const.dart';

class HeaderTop extends StatefulWidget {
  const HeaderTop(
      {super.key, required this.profileSrc, required this.username});

  final String profileSrc;
  final String username;

  @override
  State<HeaderTop> createState() => _HeaderTopState();
}

class _HeaderTopState extends State<HeaderTop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                color: dark3,
                child: SvgPicture.asset(
                  'assets/images/logos/logo_dark.svg',
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  color: medium0.withOpacity(0.3),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 110.0, right: 24.0, top: 4.0, bottom: 4.0),
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
                            color: medium0,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            fontSize: 20,
                          ),
                        ),
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
                  height: 70.0,
                  width: 70.0,
                ),
              ),
            ))
      ],
    );
  }
}

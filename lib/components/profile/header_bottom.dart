import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:flutter/gestures.dart';

class HeaderBottom extends StatefulWidget {
  const HeaderBottom({super.key, required this.bio});

  final String bio;

  @override
  State<HeaderBottom> createState() => _HeaderBottomState();
}

class _HeaderBottomState extends State<HeaderBottom> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: Text(
            widget.bio,
            maxLines: isExpanded ? 10 : 2,
            style: const TextStyle(
              fontFamily: "IBM Plex Sans Regular",
              color: neutralDark2,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontFamily: "IBM Plex Sans Regular",
                      color: neutralMedium0,
                    ),
                    text: isExpanded ? "Show less" : "Show more",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      }),
              ),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: neutralMedium0,
              )
            ],
          ),
        ),
      ],
    );
  }
}

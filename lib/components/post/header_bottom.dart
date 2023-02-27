import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/common/const.dart';
import 'package:flutter/gestures.dart';

class HeaderBottom extends StatefulWidget {
  const HeaderBottom({super.key, required this.title});

  final String title;

  @override
  State<HeaderBottom> createState() => _HeaderBottomState();
}

class _HeaderBottomState extends State<HeaderBottom> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 8),
      color: Colors.white,
      child: Text(
        widget.title,
        maxLines: isExpanded ? 10 : 2,
        style: const TextStyle(
            fontFamily: "IBM Plex Sans Regular",
            color: neutralDark2,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w700,
            fontSize: 20),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

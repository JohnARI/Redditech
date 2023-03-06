import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class SubredditList extends StatelessWidget {
  const SubredditList(
      {super.key,
      required this.subredditName,
      required this.numberOfMembers,
      required this.bottomPadding,
      required this.iconImg});
  final String subredditName, numberOfMembers, iconImg;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
      decoration: const BoxDecoration(
        color: light0,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: medium3,
            offset: Offset(-1, 0),
          ),
        ],
      ),
      child: ListTile(
        style: ListTileStyle.list,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: (() {
              if (iconImg.isNotEmpty) {
                return Image.network(iconImg);
              }
              return Image.asset(
                'assets/images/giga_chad.jpg',
                fit: BoxFit.cover,
              );
            }()),
          ),
        ),
        title: Text(
          'r/$subredditName',
          style: const TextStyle(
            color: medium0,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Community • $numberOfMembers members',
        ),
      ),
    );
  }
}

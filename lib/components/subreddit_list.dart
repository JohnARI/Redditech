import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class SubredditList extends StatelessWidget {
  const SubredditList(
      {super.key,
      required this.subredditName,
      required this.community,
      required this.numberOfMembers,
      required this.bottomPadding});
  final String subredditName, community, numberOfMembers;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 20,
          bottom: bottomPadding), // 59 if search bar is present, 0 if not
      decoration: containerBorder,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
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
                  child: Image.asset(
                    'assets/images/giga_chad.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text(
                'r/ChaseAfterYourDreams',
                style: TextStyle(
                  color: medium0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '$community • $numberOfMembers members',
              ),
            ),
          );
        },
      ),
    );
  }
}

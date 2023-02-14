import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditech/common/const.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  final Widget child;
  const MyAppbar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
        SliverAppBar(
          elevation: 0.0,
          toolbarHeight: 70,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24.0, bottom: 10),
                  child: Text('Home',
                      style: TextStyle(
                          fontFamily: "IBM Plex Sans Semibold",
                          fontSize: 30,
                          color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('Popular'),
                        Text('Lastest'),
                        Text('Upvotes'),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          pinned: true,
          backgroundColor: medium0,
          expandedHeight: 150,
          flexibleSpace: SafeArea(
            child: FlexibleSpaceBar(
              background: SvgPicture.asset(
                'assets/images/logos/logo_dark.svg',
                fit: BoxFit.fitWidth,
                color: dark1.withOpacity(0.1),
              ),
            ),
          ),
        )
      ],
      body: Container(
          color: Colors.white,
          child: Column(
            children: [child],
          )),
    );
  }
}

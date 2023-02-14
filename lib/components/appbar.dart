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
                  padding: EdgeInsets.all(8.0),
                  child: Text('Home',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                  child: Center(child: Text(title)),
                ),
              ],
            ),
          ),
          pinned: true,
          backgroundColor: medium0,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: SafeArea(
              child: SvgPicture.asset(
                'assets/images/logos/logo_dark.svg',
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

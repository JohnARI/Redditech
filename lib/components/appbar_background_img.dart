import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class AppbarBackgroundImg extends StatelessWidget {
  const AppbarBackgroundImg(
      {super.key, required this.subredditName, required this.backgroundImg});
  final String subredditName, backgroundImg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 120,
            backgroundColor: medium0,
            flexibleSpace: FlexibleSpaceBar(
              background: ColorFiltered(
                colorFilter: const ColorFilter.matrix([
                  0.6, 0, 0, 0, 0, // Red channel
                  0, 0.6, 0, 0, 0, // Green channel
                  0, 0, 0.6, 0, 0, // Blue channel
                  0, 0, 0, 1, 0, // Alpha channel
                ]),
                child: Image.network(
                  backgroundImg,
                  fit: BoxFit.cover,
                ),
              ),
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  subredditName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

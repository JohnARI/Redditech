import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, required this.image});

final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            color: dark0,
            child: Center(
              child: GestureDetector(
                child: Hero(
                  tag: "postImage",
                  child: Image.network(
                    image,
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
          SafeArea(
            child: Positioned(
              top: 24,
              left: 24,
              child: IconButton(
                icon: const Icon(Icons.close_rounded),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class OverflowImg extends StatelessWidget {
  const OverflowImg({
    super.key,
    required this.backgroundImg,
  });

  final Widget backgroundImg;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.0,
      left: 24.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), child: backgroundImg),
      ),
    );
  }
}

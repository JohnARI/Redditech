import 'package:flutter/material.dart';

class TextButtonStyle extends StatelessWidget {
  const TextButtonStyle({super.key, required this.text, required this.onpressed});

  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: onpressed,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w400)),
    );
  }
}

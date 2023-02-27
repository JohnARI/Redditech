import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        height: 59,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: light1,
              border: Border.all(
                color: medium0,
                width: 1,
              ),
            ),
            child: const TextField(
              style: TextStyle(
                color: neutralDark1,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search_rounded, color: medium0),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:redditech/common/const.dart';

class BottomNavbar extends StatefulWidget {
  final Function(int) onSelectedIndexChanged;
  const BottomNavbar({super.key, required this.onSelectedIndexChanged});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.floating,
      snakeShape: SnakeShape.circle,
      snakeViewColor: medium0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() => _selectedIndex = index);
        widget.onSelectedIndexChanged(_selectedIndex);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_rounded)),
        BottomNavigationBarItem(icon: Icon(Icons.add)),
        BottomNavigationBarItem(icon: Icon(Icons.search)),
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined)),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
    );
  }
}

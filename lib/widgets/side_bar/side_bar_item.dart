import 'package:flutter/material.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({super.key, required this.name, required this.provider, required this.icon});

  final SideBarProvider provider;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        provider.setSelected(name);
      },
      icon: Icon(icon),
      iconSize: 24,
      color: provider.selected == name ? Colors.black : Colors.white,
      style: IconButton.styleFrom(
          backgroundColor: provider.selected == name ? Colors.white : Colors.black,
          fixedSize: Size(100, 24),
          padding: EdgeInsets.only(bottom: 16, top: 8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12), right: Radius.circular(-12)))),
    );
  }
}

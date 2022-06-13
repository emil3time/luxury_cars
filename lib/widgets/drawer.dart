import 'package:flutter/material.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.white24,
      thickness: 3,
      endIndent: 30,
      height: 1,
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback goTo;
  const DrawerItem(
      {required this.title, required this.goTo, required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Comfortaa',
            color: Colors.white,
          ),
        ),
        onTap: goTo);
  }
}

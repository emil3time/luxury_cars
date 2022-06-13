import 'package:flutter/material.dart';
import 'package:luxury_cars/screens/list_car_page.dart';

import 'drawer.dart';

class AppBarDrawer extends StatefulWidget {
  const AppBarDrawer({Key? key}) : super(key: key);

  @override
  State<AppBarDrawer> createState() => _AppBarDrawerState();
}

class _AppBarDrawerState extends State<AppBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white12,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.black12,
            title: const Text(
              'Menu',
              style: TextStyle(fontFamily: 'Comfortaa', fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          DrawerItem(
              icon: Icons.shop_two_outlined,
              title: 'Home',
              goTo:()=>Navigator.pop(context)
              ),
          const DrawerDivider(),
          DrawerItem(
            icon: Icons.send_outlined,
            title: 'Car List',
            goTo: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CarListPage()),
              );
            }, //Todo car list
          ),
        ],
      ),
    );
  }
}

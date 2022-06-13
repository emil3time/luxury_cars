import 'package:flutter/material.dart';

import '../widgets/app_bar_drawer.dart';

enum FilterSwitch { all, favorite }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'Luxury Cars',
          style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: const AppBarDrawer(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset('lib/assets/home.jpg').image),
          ),
        ),
      ),
    );
  }
}

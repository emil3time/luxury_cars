import 'package:flutter/material.dart';
import 'package:luxury_cars/screens/edit_car_page.dart';


import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes:   {
    '/editCar': (context) => const EditCarPage(),
  },
    );
  }
}

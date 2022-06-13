import 'package:flutter/material.dart';
import 'package:luxury_cars/screens/add_car_page.dart';
import 'package:luxury_cars/widgets/car_greed_view.dart';

import '../models/car_model.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({Key? key}) : super(key: key);

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  Widget build(BuildContext context) {
    addCar(Car car) {
      carList.add(car);
      setState(() {});
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddCarPage(
                      addNewCar: addCar,
                    )),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),

      ),
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Car Collection'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,60),
        child: CarsGrid(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:luxury_cars/widgets/car_tile.dart';

import '../models/car_model.dart';

List<Car> carList = [
  Car(
    name: 'Mercedes Wx34',
    id: '001',
    imageURL:
        'https://cdn.pixabay.com/photo/2019/06/28/03/23/auto-4303391_960_720.jpg',
    price: 130000,
    acceleration: 12.5,
    isElectric: false,
    carType: CarType.classic,
  ),
  Car(
    name: 'Audi A8',
    id: '002',
    imageURL:
        'https://cdn.pixabay.com/photo/2016/12/07/21/50/car-1890494_960_720.jpg',
    price: 100000,
    acceleration: 6.8,
    isElectric: true,
    carType: CarType.sport,
  ),
  Car(
    name: 'Alfa Romeo 12C',
    id: '003',
    imageURL:
        'https://cdn.pixabay.com/photo/2015/08/03/00/09/alfa-romeo-12c-872585_960_720.jpg',
    price: 80000,
    acceleration: 8.9,
    isElectric: false,
    carType: CarType.classic,
  ),
  Car(
    name: 'Cadilac Escalade',
    id: '004',
    imageURL:
        'https://cdn.pixabay.com/photo/2020/06/06/02/00/cadillac-escalade-5264975_1280.jpg',
    price: 150000,
    acceleration: 11.2,
    isElectric: false,
    carType: CarType.family,
  ),
  Car(
    name: 'Mercedes AMG',
    id: '005',
    imageURL:
        'https://cdn.pixabay.com/photo/2019/10/06/18/49/mercedes-4530972_960_720.jpg',
    price: 140000,
    acceleration: 5.7,
    isElectric: false,
    carType: CarType.sport,
  ),
  Car(
    name: 'Lamborghini',
    id: '006',
    imageURL:
        'https://cdn.pixabay.com/photo/2013/10/12/16/34/lamborghini-194484_960_720.jpg',
    price: 270000,
    acceleration: 4.7,
    isElectric: true,
    carType: CarType.sport,
  )
];

class CarsGrid extends StatefulWidget {
  const CarsGrid({Key? key}) : super(key: key);

  @override
  State<CarsGrid> createState() => _CarsGridState();
}

class _CarsGridState extends State<CarsGrid> {
  updateGrid() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: carList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 330,
            crossAxisCount: 1,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) => CarTile(
              updadeGrid: updateGrid,
              car: carList[i],
            ));
  }
}

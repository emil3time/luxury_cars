import 'package:flutter/material.dart';

import '../const.dart';
import '../models/car_model.dart';
import '../widgets/custom_input_decoration.dart';

class EditCarPage extends StatefulWidget {
  const EditCarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditCarPage> createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController carImageURLController = TextEditingController();
 
  String carType = 'Select';
  @override
  void initState() {
    super.initState();
  }

  Map carData = {};

  @override
  Widget build(BuildContext context) {
    carData = ModalRoute.of(context)!.settings.arguments as Map;
    Car car = carData['car'];

    switch (car.carType) {
      case CarType.classic:
        carType = 'Classic';
        break;
      case CarType.family:
        carType = 'Family';
        break;
      case CarType.sport:
        carType = 'Sport';
        break;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Car Editor'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          key.currentState!.save();
          FocusScope.of(context).unfocus();
          setState(() {});
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: SizedBox(
                height: 800,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 15,
                        initialValue: car.name,
                        onSaved: (newValue) {
                          car.name = newValue!;
                        },
                        decoration: customInputDecoration('car name'),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: car.acceleration.toString(),
                        onSaved: (newValue) {
                          car.acceleration = double.parse(newValue!);
                        },
                        decoration: customInputDecoration('acceleration'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: car.price.toString(),
                        onSaved: (newValue) {
                          car.price = int.parse(newValue!);
                        },
                        decoration: customInputDecoration('price'),
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton<String>(
                            value: carType,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              width: 320,
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                carType = newValue!;
                                switch (newValue) {
                                  case 'Classic':
                                    car.carType = CarType.classic;
                                    break;
                                  case 'Family':
                                    car.carType = CarType.family;
                                    break;
                                  case 'Sport':
                                    car.carType = CarType.sport;
                                    break;
                                }
                              });
                            },
                            items: <String>[
                              'Select',
                              'Classic',
                              'Family',
                              'Sport'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 150,
                            width: 250,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                              color: Colors.blue.shade200,
                            )),
                            child: car.imageURL.isEmpty
                                ? const Center(child: Text('Enter a URL'))
                                : FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Image.network(car.imageURL),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: car.imageURL,
                        onSaved: (newValue) {
                          car.imageURL = newValue!;
                        },
                        decoration: customInputDecoration('image URL'),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('is Elrctic', style: h3.copyWith(color: Colors.black),),
                      Switch(
                        value: car.isElectric,
                        onChanged: (value) {
                          setState(() {
                            car.isElectric = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  padding: const EdgeInsets.only(right: 35),
                                  onPressed: () {
                                    Navigator.pop(context, car);
                                  },
                                  icon: Icon(
                                    Icons.skip_previous,
                                    size: 55,
                                    color: Colors.blue.shade200,
                                  )),
                              const Text('Cancel')
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  padding: const EdgeInsets.only(right: 35),
                                  onPressed: () {
                                    key.currentState!.save();
                                    Navigator.pop(context, car);
                                  },
                                  icon: Icon(
                                    Icons.update,
                                    size: 55,
                                    color: Colors.blue.shade200,
                                  )),
                              const Text('Update')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

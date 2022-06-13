import 'package:flutter/material.dart';
import 'package:luxury_cars/const.dart';
import 'package:uuid/uuid.dart';

import '../models/car_model.dart';
import '../widgets/custom_input_decoration.dart';
//ignore: must_be_immutable
class AddCarPage extends StatefulWidget {
  Car car = Car(
      name: 'name',
      id: const Uuid().v1(),
      imageURL: '',
      price: 123,
      acceleration: 3213,
      isElectric: true,
      carType: CarType.classic);
  Function addNewCar;

  AddCarPage({Key? key, required this.addNewCar}) : super(key: key);

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController carImageURLController = TextEditingController();

  String carType = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Car'),
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
                        initialValue: 'name',
                        onSaved: (newValue) {
                          widget.car.name = newValue!;
                        },
                        decoration: customInputDecoration('car name'),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: 0.0.toString(),
                        onSaved: (newValue) {
                          widget.car.acceleration = double.parse(newValue!);
                        },
                        decoration: customInputDecoration('acceleration'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: 0.toString(),
                        onSaved: (newValue) {
                          widget.car.price = int.parse(newValue!);
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
                                    widget.car.carType = CarType.classic;
                                    break;
                                  case 'Family':
                                    widget.car.carType = CarType.family;
                                    break;
                                  case 'Sport':
                                    widget.car.carType = CarType.sport;
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
                            child: widget.car.imageURL.isEmpty
                                ? const Center(child: Text('Enter a URL'))
                                : FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Image.network(widget.car.imageURL),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: '',
                        onSaved: (newValue) {
                          widget.car.imageURL = newValue!;
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
                        value: widget.car.isElectric,
                        onChanged: (value) {
                          setState(() {
                            widget.car.isElectric = value;
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
                                    Navigator.pop(context);
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
                                    widget.addNewCar(widget.car);
                                    Navigator.pop(context, widget.car);
                                  },
                                  icon: Icon(
                                    Icons.data_saver_on_rounded,
                                    size: 55,
                                    color: Colors.blue.shade200,
                                  )),
                              const Text('Add New Car')
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

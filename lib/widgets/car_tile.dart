import 'package:flutter/material.dart';
import 'package:luxury_cars/models/car_model.dart';
import 'package:luxury_cars/widgets/car_greed_view.dart';

import '../const.dart';

//ignore: must_be_immutable
class CarTile extends StatefulWidget {
  CarTile({required this.car, required this.updadeGrid, Key? key})
      : super(key: key);

  Car car;
  Function updadeGrid;

  @override
  State<CarTile> createState() => _CarTileState();
}

class _CarTileState extends State<CarTile> {
  @override
  Widget build(BuildContext context) {
    Car editedCar = widget.car;
    return InkWell(
      onLongPress: () async {
        editedCar = await Navigator.pushNamed(context, '/editCar',
                arguments: {'car': widget.car}).then(
              (value) {
                int carIndex = carList
                    .indexWhere(((element) => element.id == widget.car.id));

                carList[carIndex] = editedCar;
                setState(() {});
                return value as Car;
              },
            ) ??
            widget.car;
      },
      child: Dismissible(
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Icon(
            Icons.delete_forever,
            size: 50,
          ),
        ),
        key: ValueKey(widget.car.id),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text(
                'Do you want to remove Car from the list?',
              ),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                MaterialButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) {
          carList.removeWhere((element) => element.id == widget.car.id);
          widget.updadeGrid();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 4,
                offset: Offset(2, 6), // Shadow position
              ),
            ],
            gradient: const LinearGradient(
                colors: [Colors.redAccent, Colors.blueAccent]),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              header: Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  color: Colors.black54,
                  child: Text('price ${widget.car.price} \$',
                      textAlign: TextAlign.center, style: h3)),
              footer: GridTileBar(
                leading: Text(
                  ' 0 - 100 kph ${widget.car.acceleration.toString()} s',
                  style: h1,
                ),
                subtitle: Icon(
                  widget.car.isElectric
                      ? Icons.battery_2_bar_sharp
                      : Icons.construction_rounded,
                  color: Colors.green,
                ),
                trailing: Text(
                  widget.car.name,
                  style: h1,
                ),
                backgroundColor: Colors.black54,
                title: const FittedBox(
                  fit: BoxFit.scaleDown,
                ),
              ),
              child: Image.network(widget.car.imageURL, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

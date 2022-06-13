enum CarType {
  classic,
  family,
  sport,
}

class Car {
  String name;
  String imageURL;
  String id;
  int price;
  double acceleration;
  bool isElectric;
  CarType carType;

  Car({
    required this.name,
    required this.id,
    required this.imageURL,
    required this.price,
    required this.acceleration,
    required this.isElectric,
    required this.carType,
  });
}

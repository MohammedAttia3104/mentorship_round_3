import '../models/drink.dart';

class Report {
  final Drink topSellingDrinks;
  final int totalOrdersServed;

  Report({
    required this.topSellingDrinks,
    required this.totalOrdersServed,
  });
}

import '../models/order.dart';

class Report {
  final Map<DrinkType, int> topSellingDrinks;
  final int totalOrdersServed;

  Report({
    required this.topSellingDrinks,
    required this.totalOrdersServed,
  });
}

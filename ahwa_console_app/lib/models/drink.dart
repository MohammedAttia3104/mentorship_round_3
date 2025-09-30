import '../models/order.dart';

class Drink {
  final DrinkType drinkType;
  final int quantity;

  Drink({required this.drinkType, this.quantity = 1});
}

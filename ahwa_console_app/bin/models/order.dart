enum DrinkType { shai, turkishCoffee, hibiscusTea }

enum SpecialInstruction { extraMint, noSugar, yarais, other }

enum OrderStatus { pending, completed }

class Order {
  final int orderId;
  final String customerName;
  final DrinkType drinkType;
  final List<SpecialInstruction> specialInstructions;
  OrderStatus status;

  Order({
    required this.orderId,
    required this.customerName,
    required this.drinkType,
    this.specialInstructions = const [],
    this.status = OrderStatus.pending,
  });
}

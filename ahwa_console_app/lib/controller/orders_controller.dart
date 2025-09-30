import '../models/order.dart';
import '../repository/order_repository.dart';

class OrdersController {
  final OrderRepository orderRepository;

  OrdersController({required this.orderRepository});

  void addOrder(
    int orderId,
    String customerName,
    DrinkType drinkType,
    List<SpecialInstruction> specialInstructions,
  ) {
    final order = Order(
      orderId: orderId,
      customerName: customerName,
      drinkType: drinkType,
      specialInstructions: specialInstructions,
    );
    orderRepository.addOrder(order);
  }

  void completeOrder(int orderId) {
    orderRepository.markOrderAsCompleted(orderId);
  }

  List<Order> viewPendingOrders() {
    return orderRepository.getPendingOrders();
  }
}

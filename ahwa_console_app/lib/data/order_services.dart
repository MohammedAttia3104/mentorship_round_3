import '../models/order.dart';

abstract class OrderServices {
  void addOrder(Order order);

  void markOrderAsCompleted(int orderId);

  List<Order> getPendingOrders();

  List<Order> getCompletedOrders();
}

class OrderServicesImpl implements OrderServices {
  final List<Order> _orders = [];

  @override
  void addOrder(Order order) {
    _orders.add(order);
  }

  @override
  List<Order> getPendingOrders() {
    return _orders
        .where((order) => order.status == OrderStatus.pending)
        .toList();
  }

  @override
  List<Order> getCompletedOrders() {
    return _orders
        .where((order) => order.status == OrderStatus.completed)
        .toList();
  }

  @override
  void markOrderAsCompleted(int orderId) {
    ///Todo :  need to handle exception if order not found
    final order = _orders.firstWhere(
      (order) => order.orderId == orderId,
      orElse: () => throw Exception('Order not found'),
    );
    order.status = OrderStatus.completed;
  }
}

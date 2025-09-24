import '../models/order.dart';
import '../data/order_services.dart';

abstract class OrderRepository {
  void addOrder(Order order);

  void markOrderAsCompleted(int orderId);

  List<Order> getPendingOrders();

  List<Order> getCompletedOrders();

  List<Order> getAllOrders();
}

class OrderRepositoryImpl implements OrderRepository {
  final OrderServices _orderServices;

  OrderRepositoryImpl(this._orderServices);

  @override
  void addOrder(Order order) {
    _orderServices.addOrder(order);
  }

  @override
  void markOrderAsCompleted(int orderId) {
    _orderServices.markOrderAsCompleted(orderId);
  }

  @override
  List<Order> getPendingOrders() {
    return _orderServices.getPendingOrders();
  }

  @override
  List<Order> getCompletedOrders() {
    return _orderServices.getCompletedOrders();
  }

  @override
  List<Order> getAllOrders() {
    return [..._orderServices.getPendingOrders(), ..._orderServices.getCompletedOrders()];
  }
}

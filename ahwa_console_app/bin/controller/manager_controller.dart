import '../models/order.dart';
import '../models/report.dart';
import '../repository/order_repository.dart';
import '../repository/report_repository.dart';

class ManagerController {
  final OrderRepository orderRepository;
  final ReportRepository reportRepository;

  ManagerController({
    required this.orderRepository,
    required this.reportRepository,
  });

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

  Map<DrinkType, int> generateTopSellingDrinksReport() {
    return reportRepository.generateTopSellingDrinksReport();
  }

  int getTotalOrdersServed() {
    return orderRepository.getCompletedOrders().length;
  }

  Report generateDailySalesReport() {
    return reportRepository.generateDailyReport();
  }
}
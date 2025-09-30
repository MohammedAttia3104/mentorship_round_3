import '../models/drink.dart';
import '../models/report.dart';
import '../repository/order_repository.dart';
import '../repository/report_repository.dart';

class ReportsController {
  final OrderRepository orderRepository;
  final ReportRepository reportRepository;

  ReportsController(
      {required this.reportRepository, required this.orderRepository});

  Drink generateTopSellingDrinksReport() {
    return reportRepository.generateTopSellingDrinksReport();
  }

  int getTotalOrdersServed() {
    return orderRepository.getCompletedOrders().length;
  }

  Report generateDailySalesReport() {
    return reportRepository.generateDailyReport();
  }
}

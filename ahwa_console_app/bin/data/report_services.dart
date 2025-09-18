import '../models/order.dart';
import '../models/report.dart';
import 'order_services.dart';

abstract class ReportServices {
  int getTotalOrdersServed();

  Map<DrinkType, int> generateTopSellingDrinksReport();

  Report generateDailyReport();
}

class ReportServicesImpl implements ReportServices {
  final OrderServices _orderServices;

  ReportServicesImpl(this._orderServices);

  @override
  int getTotalOrdersServed() {
    return _orderServices.getCompletedOrders().length;
  }

  @override
  Map<DrinkType, int> generateTopSellingDrinksReport() {
    final completedOrders = _orderServices.getCompletedOrders();
    final Map<DrinkType, int> drinkCount = {};

    for (var order in completedOrders) {
      drinkCount.update(
        order.drinkType,
        (count) => count + 1,
        ifAbsent: () => 1,
      );
    }

    return drinkCount;
  }

  @override
  generateDailyReport() {
    final totalOrders = _orderServices.getCompletedOrders().length;
    final topSellingDrinks = generateTopSellingDrinksReport();
    return Report(
      totalOrdersServed: totalOrders,
      topSellingDrinks: topSellingDrinks,
    );
  }
}

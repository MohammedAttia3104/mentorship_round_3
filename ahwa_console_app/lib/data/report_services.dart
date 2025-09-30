import '../models/order.dart';
import '../models/report.dart';
import '../models/drink.dart';
import 'order_services.dart';

abstract class ReportServices {
  int getTotalOrdersServed();

  Drink generateTopSellingDrinksReport();

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
  Drink generateTopSellingDrinksReport() {
    final completedOrders = _orderServices.getCompletedOrders();
    final Map<DrinkType, int> drinkCount = {};

    for (var order in completedOrders) {
      drinkCount.update(
        order.drinkType,
        (count) => count + 1,
        ifAbsent: () => 1,
      );
    }

    final topDrinkType = drinkCount.entries.isNotEmpty
        ? drinkCount.entries.reduce((a, b) => a.value > b.value ? a : b).key
        : null;

    return topDrinkType != null ? Drink(drinkType: topDrinkType) : Drink(drinkType: DrinkType.none);
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

import '../data/report_services.dart';
import '../models/order.dart';
import '../models/report.dart';

abstract class ReportRepository {
  int getTotalOrdersServed();

  Map<DrinkType, int> generateTopSellingDrinksReport();

  Report generateDailyReport();
}

class ReportRepositoryImpl implements ReportRepository {
  final ReportServices _reportServices;

  ReportRepositoryImpl(this._reportServices);

  @override
  int getTotalOrdersServed() {
    return _reportServices.getTotalOrdersServed();
  }

  @override
  Map<DrinkType, int> generateTopSellingDrinksReport() {
    return _reportServices.generateTopSellingDrinksReport();
  }

  @override
  Report generateDailyReport() {
    return _reportServices.generateDailyReport();
  }
}

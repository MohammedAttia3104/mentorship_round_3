import '../data/report_services.dart';
import '../models/drink.dart';
import '../models/report.dart';

abstract class ReportRepository {
  int getTotalOrdersServed();

  Drink generateTopSellingDrinksReport();

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
  Drink generateTopSellingDrinksReport() {
    return _reportServices.generateTopSellingDrinksReport();
  }

  @override
  Report generateDailyReport() {
    return _reportServices.generateDailyReport();
  }
}

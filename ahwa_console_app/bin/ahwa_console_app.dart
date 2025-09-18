import 'controller/manager_controller.dart';
import 'data/order_services.dart';
import 'data/report_services.dart';
import 'models/order.dart';
import 'repository/order_repository.dart';
import 'repository/report_repository.dart';

void main(List<String> arguments) {
  final orderServices = OrderServicesImpl();
  final reportServices = ReportServicesImpl(orderServices);

  final orderRepository = OrderRepositoryImpl(orderServices);
  final reportRepository = ReportRepositoryImpl(reportServices);

  //DI Problem
  final managerController = ManagerController(
    orderRepository: orderRepository,
    reportRepository: reportRepository,
  );

  print('Adding Orders...');
  managerController.addOrder(1, 'mohamed', DrinkType.hibiscusTea, [
    SpecialInstruction.extraMint,
    SpecialInstruction.noSugar,
  ]);

  managerController.addOrder(2, 'm2', DrinkType.shai, []);
  managerController.addOrder(3, 'm3', DrinkType.turkishCoffee, [
    SpecialInstruction.other,
  ]);

  print('Pending Orders:');
  for (var order in managerController.viewPendingOrders()) {
    print(
      'Order ID: ${order.orderId}, Customer: ${order.customerName}, Drink: ${order.drinkType}, Instructions: ${order.specialInstructions}',
    );
  }

  managerController.completeOrder(1);

  print('\nAfter completing Order ID 1:');
  print('Pending Orders:');
  for (var order in managerController.viewPendingOrders()) {
    print(
      'Order ID: ${order.orderId}, Customer: ${order.customerName}, Drink: ${order.drinkType}, Instructions: ${order.specialInstructions}',
    );
  }

  print('\nTotal Orders Served: ${managerController.getTotalOrdersServed()}');

  print(
    '-------------------------------------------------------------------------------',
  );
  print('\nTop Selling Drinks Report:');
  final topSellingDrinks = managerController.generateTopSellingDrinksReport();
  topSellingDrinks.forEach((drink, count) {
    print('Drink: $drink, Sold: $count\n');
  });
  print(
    '-------------------------------------------------------------------------------',
  );
  print('\nDaily Sales Report:');
  final dailyReport = managerController.generateDailySalesReport();
  print('Total Orders: ${dailyReport.totalOrdersServed}');

  //Top Selling Drink: specific one by one drink and its count
}

/*
Question 6: User Story - Smart Ahwa Manager App


Question: As a professional ahwa owner in Cairo, I want a Smart Ahwa Manager
app in Flutter to streamline operations, so I can efficiently manage customer
orders, track popular items, and generate daily sales reports to optimize my
business. The app should allow me to add orders with a customer name, drink
type (e.g., shai, Turkish coffee, hibiscus tea), and special instructions (e.g., “extra
mint, ya rais”); mark orders as completed; view a dashboard of pending orders;
and generate a report of top-selling drinks and total orders served. Design and
implement this app using at least three SOLID principles and core OOP concepts
(e.g., inheritance, polymorphism, encapsulation). Submit your Dart code along
with a 1-2 paragraph explanation justifying how the principles are applied, why
they matter in this context, and how they link to The Object-Oriented Thought
Process (e.g., modularity, abstraction).
 */

import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/widgets/layout_widgets/layout_widgets_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      navigatorObservers: [RouteObserver()],
      // home: InteractionWidgets(),
      // home: DraggableScrollableSheetExample(),
      // home: AutoComplete(),
      home: LayoutWidgetsExample(),
    );
  }
}

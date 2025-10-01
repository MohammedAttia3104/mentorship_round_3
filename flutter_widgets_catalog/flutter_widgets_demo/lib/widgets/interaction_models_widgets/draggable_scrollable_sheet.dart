import 'package:flutter/material.dart';

class DraggableScrollableSheetExample extends StatelessWidget {
  const DraggableScrollableSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.25,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.blue[100],
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      ),
    );
  }
}

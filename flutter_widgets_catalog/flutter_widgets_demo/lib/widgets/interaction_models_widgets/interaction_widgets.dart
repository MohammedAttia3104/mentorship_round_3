import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/widgets/interaction_models_widgets/widgets/absorb_pointer.dart';
import 'package:flutter_widget_catalog/widgets/interaction_models_widgets/widgets/drag_target.dart';
import 'package:flutter_widget_catalog/widgets/interaction_models_widgets/widgets/draggable.dart';
import 'package:flutter_widget_catalog/widgets/interaction_models_widgets/widgets/ignore_pointer.dart';
import 'package:flutter_widget_catalog/widgets/interaction_models_widgets/widgets/interactive_viewer.dart';

import 'draggable_scrollable_sheet.dart';

class InteractionWidgets extends StatefulWidget {
  const InteractionWidgets({super.key});

  @override
  State<InteractionWidgets> createState() => _InteractionWidgetsState();
}

class _InteractionWidgetsState extends State<InteractionWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                spacing: 8.0,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 16.0,
                    children: [
                      Expanded(child: AbsorbPointerWidget()),
                      Expanded(child: IgnorePointerWidget()),
                    ],
                  ),
                  SizedBox(height: 40),
                  DraggableWidget(),
                  const SizedBox(height: 50),
                  DragTargetWidget(),
                  const SizedBox(height: 50),
                  Divider(thickness: 2, color: Colors.grey[300]),
                  InteractiveViewerExample(),
                  SizedBox(height: 50),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

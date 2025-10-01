import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///Draggable Widget
    /// data: The data that is passed to the DragTarget when the Draggable is dropped.
    /// feedback: The widget that follows the user's finger during the drag operation.
    /// childWhenDragging: The widget that is displayed in place of the original widget while it is being dragged.
    /// child: The widget that is displayed when the Draggable is not being dragged.
    return Draggable(
      data: 'Draggable',
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Text(
            '** Dragging **',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      childWhenDragging: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Original Position',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Draggable',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

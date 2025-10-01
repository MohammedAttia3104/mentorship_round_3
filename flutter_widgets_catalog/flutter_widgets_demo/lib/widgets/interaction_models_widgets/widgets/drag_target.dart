import 'package:flutter/material.dart';

class DragTargetWidget extends StatelessWidget {
  const DragTargetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// DragTarget Widget
    /// builder: The builder function that builds the widget tree for the DragTarget.
    /// onWillAcceptWithDetails: A callback that is called when a draggable is hovering over the DragTarget.
    /// onAcceptWithDetails: A callback that is called when a draggable is dropped onto the DragTarget.
    /// onLeave: A callback that is called when a draggable leaves the DragTarget without dropping.
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            color: candidateData.isEmpty
                ? Colors.grey[300]
                : Colors.green[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              candidateData.isEmpty
                  ? 'Drag Here'
                  : 'Release to Drop',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        );
      },
      onWillAcceptWithDetails: (data) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Will Accept ${data.data}')),
        );
        return true;
      },
      onAcceptWithDetails: (data) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$data Dropped')));
      },
      onLeave: (data) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Left $data')));
      },
    );
  }
}

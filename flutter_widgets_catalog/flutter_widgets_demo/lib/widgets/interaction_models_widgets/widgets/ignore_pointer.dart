import 'package:flutter/material.dart';

class IgnorePointerWidget extends StatelessWidget {
  const IgnorePointerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///Ignore Pointer Widget
    /// Not Clickable
    /// Used to disable interaction with the widget and its children
    /// Unlike AbsorbPointer, it does not prevent its children from receiving pointer events.
    return IgnorePointer(
      ignoring: true,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Colors.green,
          ),
          foregroundColor: WidgetStateProperty.all(
            Colors.white,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: Text('Ignore Pointer'),
      ),
    );
  }
}

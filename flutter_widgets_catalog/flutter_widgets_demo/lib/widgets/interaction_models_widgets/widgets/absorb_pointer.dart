import 'package:flutter/material.dart';

class AbsorbPointerWidget extends StatelessWidget {
  const AbsorbPointerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// Absorb Pointer Widget
    /// Not Clickable
    /// Used to disable interaction with the widget and its children
    /// Prevents its children from receiving pointer events.
    /// When absorbing is true, the widget and its children do not respond to pointer events.
    return AbsorbPointer(
      absorbing: true,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Colors.blueAccent,
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
        child: Text('Absorb Pointer'),
      ),
    );
  }
}

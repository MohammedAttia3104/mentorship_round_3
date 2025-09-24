import 'package:flutter/material.dart';

import 'focusable_draggable.dart';


class PhysicalPlaygroundChallengeScreen extends StatefulWidget {
  const PhysicalPlaygroundChallengeScreen({super.key});

  @override
  State<PhysicalPlaygroundChallengeScreen> createState() =>
      _PhysicalPlaygroundChallengeScreenState();
}

class _PhysicalPlaygroundChallengeScreenState
    extends State<PhysicalPlaygroundChallengeScreen> {
  final Map<Color, bool> _isCorrect = {
    Colors.red: false,
    Colors.blue: false,
    Colors.green: false,
  };
  Color? _hoveringColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Physical Playground'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 32.0,
                    children: const [
                      FocusableDraggable(color: Colors.red),
                      FocusableDraggable(color: Colors.blue),
                      FocusableDraggable(color: Colors.green),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 32.0,
                    children: [
                      _buildDragTarget(Colors.red),
                      _buildDragTarget(Colors.blue),
                      _buildDragTarget(Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DragTarget<Color> _buildDragTarget(Color targetColor) {
    return DragTarget<Color>(
      onWillAcceptWithDetails: (data) {
        setState(() {
          _hoveringColor = targetColor;
        });
        return true;
      },
      onLeave: (data) {
        setState(() {
          _hoveringColor = null;
        });
      },
      onAcceptWithDetails: (details) {
        setState(() {
          if (details.data == targetColor) {
            _isCorrect[targetColor] = true;
          }
          _hoveringColor = null;
        });
      },
      builder: (context, candidateData, rejectedData) {
        final isMatched = _isCorrect[targetColor] == true;
        final isHovering = candidateData.isNotEmpty && !isMatched;

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: targetColor.withValues(alpha: 0.3),
                border: Border.all(color: targetColor, width: 2),
              ),
              child: isMatched
                  ? const Icon(Icons.check, color: Colors.white, size: 40)
                  : isHovering
                  ? const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 30,
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}

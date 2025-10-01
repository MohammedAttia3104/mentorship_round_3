import 'package:flutter/material.dart';

class SmoothlyColorTransition extends StatefulWidget {
  const SmoothlyColorTransition({super.key});

  @override
  State<SmoothlyColorTransition> createState() =>
      _SmoothlyColorTransitionState();
}

class _SmoothlyColorTransitionState extends State<SmoothlyColorTransition> {
  Color _color = Colors.blue;
  Color _endColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _color = _color == Colors.blue ? Colors.green : Colors.blue;
                });
              },
              child: AnimatedContainer(
                width: 300,
                height: 200,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                color: _color,
                child: const Center(
                  child: Text(
                    'Tap to Change Color with AnimatedContainer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                setState(() {
                  _endColor =
                      _endColor == Colors.red ? Colors.purple : Colors.red;
                });
              },
              child: TweenAnimationBuilder(
                tween: ColorTween(end: _endColor),
                duration: Duration(seconds: 1),
                curve: Curves.easeInCirc,
                builder: (context, color, child) {
                  return Container(
                    width: 300,
                    height: 200,
                    color: color,
                    child: child,
                  );
                },
                child: Center(
                  child: Text(
                    'Tap to Change Color with Tween',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

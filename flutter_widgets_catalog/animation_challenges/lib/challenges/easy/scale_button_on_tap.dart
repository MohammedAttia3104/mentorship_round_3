import 'package:flutter/material.dart';

class ScaleButtonOnTap extends StatefulWidget {
  const ScaleButtonOnTap({super.key});

  @override
  State<ScaleButtonOnTap> createState() => _ScaleButtonOnTapState();
}

class _ScaleButtonOnTapState extends State<ScaleButtonOnTap> {
  double _scale = 1.0;
  bool _isScaled = false;
  double _beginScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 100,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _scale = _scale == 1.0 ? 1.3 : 1.0;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 240 * _scale,
                height: 60 * _scale,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Tap to Scale',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: _beginScale,
                end: _isScaled ? 1.3 : _beginScale,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isScaled = !_isScaled;
                    if (!_isScaled) {
                      _beginScale = 1.0;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Tap to Scale "Tween"',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

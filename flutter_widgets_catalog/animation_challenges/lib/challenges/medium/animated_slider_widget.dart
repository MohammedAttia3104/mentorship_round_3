import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedSliderWidget extends StatefulWidget {
  const AnimatedSliderWidget({super.key});

  @override
  State<AnimatedSliderWidget> createState() => _AnimatedSliderWidgetState();
}

class _AnimatedSliderWidgetState extends State<AnimatedSliderWidget> {
  double _sliderValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.1, end: _sliderValue),
          curve: Curves.easeInOut,
          duration: Duration(
            milliseconds: 500,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Slider.adaptive(
              min: 0.1,
              value: _sliderValue,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              thumbColor: Colors.blueAccent,
              divisions: 10,
              label: _sliderValue.toStringAsFixed(1),
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
            ),
          ),
          builder: (BuildContext context, double? value, Widget? child) {
            return ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 40 * (value ?? 0.01),
                  sigmaY: 40 * (value ?? 0.01),
                ),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}

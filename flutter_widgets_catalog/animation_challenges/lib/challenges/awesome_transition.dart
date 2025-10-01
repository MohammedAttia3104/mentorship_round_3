import 'dart:ui';

import 'package:flutter/material.dart';

///-------------------------------------------------------------
///Article
///https://medium.com/flutter-community/flutter-animations-comprehensive-guide-cb93b246ca5d#:~:text=2.1.%20Explicit%20Animations%20with%20Ready%2Dto%2DUse%20Widgets
///Read code line by line
///-------------------------------------------------------------

class AwesomeTransition extends StatefulWidget {
  const AwesomeTransition({super.key});

  @override
  State<AwesomeTransition> createState() => _AwesomeTransitionState();
}

class _AwesomeTransitionState extends State<AwesomeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation =
        Tween<AlignmentGeometry>(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
        );

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      containerHeight: 200,
      child: AlignTransition(
        alignment: _alignAnimation,
        child: RotationTransition(
          turns: _rotationAnimation,
          child: const Rectangle(
            color1: pink,
            color2: pinkDark,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  const BlurContainer({super.key, this.containerHeight = 120, this.child});

  final double containerHeight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          clipBehavior: Clip.none,
          height: containerHeight,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class Rectangle extends StatelessWidget {
  const Rectangle({
    Key? key,
    this.width = 60,
    this.height = 40,
    required this.color1,
    required this.color2,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color1;
  final Color color2;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

const Color pink = Color(0xffEC6283);
const Color pinkDark = Color(0xffD64265);
const Color yellow = Color(0xffE7F18F);
const Color yellowDark = Color(0xffB8C72B);
const Color purple = Color(0xff323AE9);

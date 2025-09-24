import 'package:flutter/material.dart';

class AdvancedAnimationChainScreen extends StatefulWidget {
  const AdvancedAnimationChainScreen({super.key});

  @override
  State<AdvancedAnimationChainScreen> createState() =>
      _AdvancedAnimationChainScreenState();
}

class _AdvancedAnimationChainScreenState
    extends State<AdvancedAnimationChainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Advanced Animation Chain'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.5, end: 1),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return AnimatedOpacity(
                    opacity: value,
                    duration: Duration(seconds: 1),
                    child: child,
                  );
                },
                child: AnimatedContainer(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue),
                  duration: Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

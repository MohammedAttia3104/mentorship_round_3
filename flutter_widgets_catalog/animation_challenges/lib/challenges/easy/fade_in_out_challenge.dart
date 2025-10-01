import 'package:flutter/material.dart';

class FadeInOutChallenge extends StatefulWidget {
  const FadeInOutChallenge({super.key});

  @override
  State<FadeInOutChallenge> createState() => _FadeInOutChallengeState();
}

class _FadeInOutChallengeState extends State<FadeInOutChallenge> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AnimatedOpacity(
                  opacity: _opacity,
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Row(
                spacing: 32,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _opacity = 1.0;
                      });
                    },
                    child: const Text('Fade In'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _opacity = 0.5;
                      });
                    },
                    child: const Text('Fade Out'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

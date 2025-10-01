import 'package:flutter/material.dart';

class LayoutWidgetsExample extends StatelessWidget {
  const LayoutWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Column(
              children: [
                ///FittedBox Widget
                FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.blue,
                    width: 200,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'FittedBox Example',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),

                ///BaseLine Widget Example
                Baseline(
                  baseline: 2.0,

                  baselineType: TextBaseline.ideographic,
                  child: Container(
                    color: Colors.green,
                    width: 200,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'Baseline Example',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                ///ConstrainedBox Widget Example
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 150,
                    minHeight: 50,
                    maxWidth: 300,
                    maxHeight: 150,
                  ),
                  child: Container(
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'ConstrainedBox Example',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                ///AspectRatio Widget Example
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        'AspectRatio Example',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                ///FractionallySizedBox Widget Example (fixed)
                SizedBox(
                  height: 200,
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.3,
                    child: Container(
                      color: Colors.teal,
                      child: const Center(
                        child: Text(
                          'FractionallySizedBox Example',
                          style:
                          TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                ///Overflow Box Widget Example
                Container(
                  color: Colors.red,
                  width: 200,
                  height: 100,
                  child: OverflowBox(
                    maxWidth: 300,
                    maxHeight: 200,
                    child: Container(
                      color: Colors.yellow,
                      width: 250,
                      height: 150,
                      child: const Center(
                        child: Text(
                          'OverflowBox Example',
                          style:
                          TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                ///SizedOverflowBox Widget Example
                Container(
                  color: Colors.brown,
                  width: 200,
                  height: 100,
                  child: SizedOverflowBox(
                    size: const Size(250, 150),
                    child: Container(
                      color: Colors.cyan,
                      width: 250,
                      height: 150,
                      child: const Center(
                        child: Text(
                          'SizedOverflowBox Example',
                          style:
                          TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

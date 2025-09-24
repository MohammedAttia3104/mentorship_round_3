import 'package:flutter/material.dart';
import 'package:ui_challenges_week_2/challenges/task_manager/task_manager_screen.dart';

import 'challenges/advanced_animation_chain/advanced_animation_chain_screen.dart';
import 'challenges/physical_playground/physical_playground_challenge_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AdvancedAnimationChainScreen(),
    );
  }
}

class ChooseChallenge extends StatelessWidget {
  const ChooseChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            Text(
              "Week 2 Challenges",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const PhysicalPlaygroundChallengeScreen(),
                  ),
                );
              },
              child: const Text('Physical Playground Challenge'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskManagerScreen(),
                  ),
                );
              },
              child: const Text('Task Manager Challenge'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdvancedAnimationChainScreen(),
                  ),
                );
              },
              child: const Text('Advanced Animation Chain Challenge'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 63, 8, 165),
            Color.fromARGB(255, 12, 1, 39),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 280, color:Color.fromARGB(200, 255, 255, 255)),
            const SizedBox(height: 80),
            const Text(
              "Challenge yourself on this quiz!",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_circle_right_outlined),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

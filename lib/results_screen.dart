import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

     return SizedBox(
    width: double.infinity,
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            const SizedBox(height: 40),

            Text(
              'You answered $numTotalCorrect out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            Expanded(
              child: SingleChildScrollView(
                child: QuestionSummary(summaryData: summaryData),
              ),
            ),

            const SizedBox(height: 20),

            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    ),
  );
  }
}

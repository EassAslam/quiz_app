import 'package:flutter/material.dart';


class QuestionSummary extends StatelessWidget{
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
  children: summaryData.map((data) {
    final isCorrect =
          data['user_answer'] == data['correct_answer'];

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number Circle
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isCorrect
                    ? const Color.fromARGB(255, 150, 198, 241)
                    : const Color.fromARGB(255, 249, 133, 241),
                shape: BoxShape.circle,
              ),
              child: Text(
                ((data['question_index'] as int) + 1).toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
             const SizedBox(width: 20),

            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question
                  Text(
                    data['question'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 236, 236, 236),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // User Answer
                  Text(
                    data['user_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 202, 171, 252),
                    ),
                  ),

                  // Correct Answer
                  Text(
                    data['correct_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 254, 246),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

}
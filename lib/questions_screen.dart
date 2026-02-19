import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionindex = 0;
  void answerQuestion(){
    setState(() {
      currentQuestionindex ++;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    final currentQuestion = questions [currentQuestionindex];
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(currentQuestion.question,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,

              ), // TextStyle
              textAlign: TextAlign.center,
            ), // Text
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item){
              return AnswerButton(answerText: item, onTap:answerQuestion);
                
              }),
            
          ],
        ),
      ), // Column
    ); // SizedBox
  }
}
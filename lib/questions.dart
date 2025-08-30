import 'package:advanced_basics_maxemellian/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:advanced_basics_maxemellian/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

var currentQuestion = questions[0];

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    //widget is a property of the State class that gives access to the current instance of the StatefulWidget,
    //this was because i have no access to the properties of the widget directly from the state class
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // to tell Flutter that something has changed in the state, and build method should be called again
      currentQuestionIndex++;
      currentQuestion = questions[currentQuestionIndex];
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                onTap: () {
                  answerQuestion(answer);
                },
                answerText: answer,
              );
            }),
          ],
        ),
      ),
    );
  }
}

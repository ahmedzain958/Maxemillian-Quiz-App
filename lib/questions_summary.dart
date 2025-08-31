import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: summaryData.map((data) {
            //data is a map with keys question_index, question, correct_answer, user_answer
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Add this line
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor:
                      (data['user_answer'] == data['correct_answer'])
                      ? Colors.cyan
                      : Colors.purple,
                  child: Text(
                    (((data['question_index'] as int) + 1).toString()),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                // add padding between circle avatar and column
                const SizedBox(width: 10),
                Expanded(
                  //ensures column takes all horizontal space of its parent row (dont exceed the row width)
                  //flex is  ROW OR Column property
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(color: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        /*takes as minimal vertical space as needed */
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300,
          color: Color.fromARGB(150, 255, 255, 255)),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}

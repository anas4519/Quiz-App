import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class QuizState extends StatefulWidget {
  const QuizState({super.key});

  @override
  State<QuizState> createState() => _QuizStateState();
}

class _QuizStateState extends State<QuizState> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  @override
  void switchScreen(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
      activeScreen = 'results-screen';
    });
    }
  }
  
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }
    if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }
    return MaterialApp(
    home: Scaffold(
      body: Container(
        
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 29, 68),
            Color.fromARGB(255, 6, 51, 117)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
        child: screenWidget,
      ),
    
    ),
  );
  }
}
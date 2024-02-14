import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: const Color.fromARGB(186, 255, 255, 255),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      
    ),
    child: Text(answerText,
    textAlign: TextAlign.center,));
  }
}

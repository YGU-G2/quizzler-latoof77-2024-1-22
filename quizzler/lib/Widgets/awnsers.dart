import 'package:flutter/material.dart';
import 'package:quizzler/Widgets/questions.dart';

class Awnsers extends StatelessWidget {
  const Awnsers({
    super.key,
    required this.list,
  });

  final MyQuestions list;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      child: Icon(
        list.theAwnser == null
            ? Icons.ac_unit_rounded
            : list.theAwnser == true
                ? Icons.check
                : Icons.close,
        color: list.theAwnser == null
            ? Color.fromARGB(255, 43, 8, 241)
            : list.theAwnser == true
                ? Color.fromARGB(255, 8, 235, 15)
                : Color.fromARGB(255, 104, 9, 2),
      ),
    );
  }
}

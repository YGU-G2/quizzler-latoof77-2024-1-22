import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({
    super.key,
    required this.questionsList,
  });

  final MyQuestions questionsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          questionsList.questionsText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class MyQuestions {
  MyQuestions(
    this.questionsText,
    this.isTrue,
  );
  String questionsText;
  bool isTrue;
  bool? theAwnser = null;
}

List<MyQuestions> myQuestionsList = <MyQuestions>[
  MyQuestions("من فوائد التاريخ تعزيز الهويه الوطنيه", true),
  MyQuestions("تقع السنة1452ه في القرن السابع عشر", false),
  MyQuestions("يمكن وضع صورة خلفية للصفحة", true),
  MyQuestions("خيانة الوطن مخالف للامانة", false),
  MyQuestions("العصر الحجري من عصور ما قبل التاريخ", true),
  MyQuestions("الحزن بالدنيااكثر من الفرح", true),
  MyQuestions("التعليم والصحة من حقوق المواطن", false),
  MyQuestions("من نتائج التزام الانظمة تحمل المسؤولية", true),
  MyQuestions("النظام هو قواعد واحكام ملزمة", false),
  MyQuestions("الانظمةالاساسية هي التي تختص بالموضوعات العامة", true),
];


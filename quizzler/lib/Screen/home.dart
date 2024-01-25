import 'package:flutter/material.dart';
import 'package:quizzler/Widgets/awnsers.dart';
import 'package:quizzler/Widgets/buttons.dart';
import 'package:quizzler/Widgets/questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  int allTrue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: (counter >= myQuestionsList.length)
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      color: Color.fromARGB(255, 3, 236, 147),
                      elevation: 20,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Text(
                              "النتيجة",
                              style: TextStyle(
                                color: Color.fromARGB(255, 5, 4, 20),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$allTrue :",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 3, 214), fontSize: 22),
                                ),
                                Icon(
                                  Icons.check,
                                  color: Color.fromARGB(255, 250, 93, 2),
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${myQuestionsList.length - allTrue} :",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 83, 0, 236),
                                      fontSize: 22),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Color.fromARGB(255, 245, 63, 3),
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Container(
                            height: 60,
                            child: Buttons(
                              btnChild: Text(
                                "محاولة مرة اخرى",
                                style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              press: () {
                                setState(() {
                                  counter = 0;
                                  allTrue = 0;
                                  for (var list in myQuestionsList) {
                                    list.theAwnser = null;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Questions(questionsList: myQuestionsList[counter]),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...myQuestionsList.map(
                          (list) => Awnsers(
                            list: list,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Buttons(
                        press: () {
                          setState(() {
                            if (!(counter >= myQuestionsList.length)) {
                              myQuestionsList[counter].theAwnser =
                                  myQuestionsList[counter].isTrue
                                      ? true
                                      : false;
                              myQuestionsList[counter].theAwnser == true
                                  ? allTrue++
                                  : allTrue;
                              counter++;
                            }
                          });
                        },
                        btnChild: Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 38,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Buttons(
                        press: () {
                          setState(() {
                            if (!(counter >= myQuestionsList.length)) {
                              myQuestionsList[counter].theAwnser =
                                  myQuestionsList[counter].isTrue
                                      ? false
                                      : true;
                              myQuestionsList[counter].theAwnser == true
                                  ? allTrue++
                                  : allTrue;
                              counter++;
                            }
                          });
                        },
                        btnChild: Text(
                          "No",
                          style: TextStyle(
                            fontSize: 38,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.search,
        //     color: Colors.indigo,
        //   ),
        // ),
        backgroundColor: Color.fromARGB(255, 233, 232, 227),
        title: Text(
          "Quizzler",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 2, 9, 46),
    );
  }
}

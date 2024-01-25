import 'package:caluclator/components/Mybutton.dart';
import 'package:caluclator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var userInput = '';
var result = '';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      Text(
                        result.toString(),
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'Ac',
                          colors: Color(0xff2196f3),
                          onpress: () {
                            userInput = '';
                            result = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '+/-',
                            onpress: () {
                              userInput = '+/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            onpress: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                          title: '/',
                          onpress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          colors: const Color(0xffff9100),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '7',
                            onpress: () {
                              userInput += '7';
                              setState(() {});
                            }),
                        MyButton(
                            title: '8',
                            onpress: () {
                              userInput += '8';
                              setState(() {});
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            onpress: () {
                              userInput += '9';
                              setState(() {});
                            }),
                        MyButton(
                          title: 'x',
                          onpress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          colors: const Color(0xffff9100),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '4',
                            onpress: () {
                              userInput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            title: '5',
                            onpress: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            onpress: () {
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                            title: '-',
                            onpress: () {
                              userInput += '-';
                              setState(() {});
                            },
                            colors: const Color(0xffff9100)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '1',
                            onpress: () {
                              userInput += '1';
                              setState(() {});
                            }),
                        MyButton(
                            title: '2',
                            onpress: () {
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            onpress: () {
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+',
                            onpress: () {
                              userInput += '+';
                              setState(() {});
                            },
                            colors: const Color(0xffff9100)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '0',
                            onpress: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'del',
                            onpress: () {
                              userInput =userInput.substring(0,userInput.length -1);
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            onpress: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '=',
                            onpress: () {
                              equalPres();
                              setState(() {});
                            },
                            colors: const Color(0xffff9100)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void equalPres() {
  String finalUserInput = userInput.replaceAll('x', '*');
  Parser p = Parser();
  Expression expression = p.parse(finalUserInput);
  ContextModel contextModel = ContextModel();

  double eval = expression.evaluate(EvaluationType.REAL, contextModel);
  result = eval.toString();
}

//Creating component

// class MyButton extends StatelessWidget {
//
//   final String title;
//   const MyButton({super.key,required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.orange,
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

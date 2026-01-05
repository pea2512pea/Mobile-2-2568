import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "MyApp", home: MyHomeWidget());
  }
}

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({super.key});

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  double num = 0;
  String num1 = "";
  String num2 = "";
  String operator = "";
  String showVal = "0";

  void pressedNumber(String value) {
    setState(() {
      if (operator == "") {
        num1 += value;
        showVal = num1;
      } else {
        num2 += value;
        showVal = num2;
      }
    });
  }

  void pressedOperator(String op) {
    setState(() {
      operator = op;
    });
  }

  void clear() {
    setState(() {
      num = 0;
      num1 = "";
      operator = "";
      showVal = "0";
    });
  }

  void calculate() {
    if (num1.isEmpty || num2.isEmpty || operator.isEmpty) return;
    double n1 = double.parse(num1);
    double n2 = double.parse(num2);
    double result = 0;

    switch(operator) {
      case "+":
        result = n1 + n2;
        break;
      case "*":
        result = n1 * n2;
        break;
      case "-":
        result = n1 - n2;
        break;
      case "/":
        result = n1 / n2;
        break;
    }

    setState(() {
      showVal = result.toString();
      num1 = showVal;
      num2 = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Calculator"))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(showVal, style: TextStyle(fontSize: 60)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFloatingButton(buttonText: "7", myCallback: () => pressedNumber("7")),
                  MyFloatingButton(buttonText: "8", myCallback: () => pressedNumber("8")),
                  MyFloatingButton(buttonText: "9", myCallback: () => pressedNumber("9")),
                  MyFloatingButton(buttonText: "+", myCallback: () => pressedOperator("+")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFloatingButton(buttonText: "4", myCallback: () => pressedNumber("4")),
                  MyFloatingButton(buttonText: "5", myCallback: () => pressedNumber("5")),
                  MyFloatingButton(buttonText: "6", myCallback: () => pressedNumber("6")),
                  MyFloatingButton(buttonText: "-", myCallback: () => pressedOperator("-")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFloatingButton(buttonText: "1", myCallback: () => pressedNumber("1")),
                  MyFloatingButton(buttonText: "2", myCallback: () => pressedNumber("2")),
                  MyFloatingButton(buttonText: "3", myCallback: () => pressedNumber("3")),
                  MyFloatingButton(buttonText: "*", myCallback: () => pressedOperator("*")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFloatingButton(buttonText: "0", myCallback: () => pressedNumber("0")),
                  MyFloatingButton(buttonText: "C", myCallback: () => clear()),
                  MyFloatingButton(buttonText: "=", myCallback: () => calculate()),
                  MyFloatingButton(buttonText: "/", myCallback: () => pressedOperator("/")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback myCallback;

  const MyFloatingButton({
    required this.buttonText,
    required this.myCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: myCallback,
        child: Text(buttonText),
      ),
    );
  }
}

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
  int num = 0;
  String num1 = "";
  String num2 = "";
  String operator = "";
  String showVal = "0";

  void pressedButton(String button) {
    if (button == "+" || button == "-" || button == "*" || button == "/") {
      return setState(() {
        operator = button;
      });
    } else {
      return setState(() {
        if (operator == "") {
          num1 += button;
          showVal = num1;
        } else {
          num2 += button;
          showVal = num2;
        }
      });
    }
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
                  MyFloatingButton(
                    buttonText: "7",
                    myCallback: () => pressedButton("7"),
                  ),
                  MyFloatingButton(
                    buttonText: "8",
                    myCallback: () => pressedButton("8"),
                  ),
                  MyFloatingButton(
                    buttonText: "9",
                    myCallback: () => pressedButton("9"),
                  ),
                  MyFloatingButton(
                    buttonText: "+",
                    myCallback: () => pressedButton("+"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFloatingButton(
                    buttonText: "4",
                    myCallback: () => pressedButton("4"),
                  ),
                  MyFloatingButton(
                    buttonText: "5",
                    myCallback: () => pressedButton("5"),
                  ),
                  MyFloatingButton(
                    buttonText: "6",
                    myCallback: () => pressedButton("6"),
                  ),
                  MyFloatingButton(
                    buttonText: "-",
                    myCallback: () => pressedButton("-"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFloatingButton(
                    buttonText: "1",
                    myCallback: () => pressedButton("1"),
                  ),
                  MyFloatingButton(
                    buttonText: "2",
                    myCallback: () => pressedButton("2"),
                  ),
                  MyFloatingButton(
                    buttonText: "3",
                    myCallback: () => pressedButton("3"),
                  ),
                  MyFloatingButton(
                    buttonText: "*",
                    myCallback: () => pressedButton("*"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFloatingButton(
                    buttonText: "0",
                    myCallback: () => pressedButton("0"),
                  ),
                  MyFloatingButton(
                    buttonText: "C",
                    myCallback: () => setState(() {
                      num = 0;
                      num1 = "";
                      operator = "";
                      showVal = "0";
                    }),
                  ),
                  MyFloatingButton(
                    buttonText: "=",
                    myCallback: () => setState(() {
                      if (num1 == "" || num2 == "") return;
                      int toNum1 = int.parse(num1);
                      int toNum2 = int.parse(num2);
                      int result = 0;
                      if (operator == "+") result = toNum1 + toNum2;
                      if (operator == "*") result = toNum1 * toNum2;
                      if (operator == "-") result = toNum1 - toNum2;
                      if (operator == "/") result = (toNum1 / toNum2) as int;
                      showVal = result.toString();
                      num1 = showVal;
                      num2 = "";
                    }),
                  ),
                  MyFloatingButton(
                    buttonText: "/",
                    myCallback: () => pressedButton("/"),
                  ),
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
      child: FloatingActionButton.extended(
        onPressed: myCallback,
        label: Text(buttonText)
      ),
    );
  }
}

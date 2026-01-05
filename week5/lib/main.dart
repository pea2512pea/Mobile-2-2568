import 'package:flutter/material.dart';
import 'package:week5/input_box.dart';
import 'package:week5/money_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Test contrainer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 120,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: InputValidationBox(),
              ),
              MoneyBox(
                title: "ยอดรับคงเหลือ",
                amount: 30000.512,
                sizeConHeight: 120,
                colorSet: Colors.lightBlue,
              ),
              MoneyBox(
                title: "รายรับ",
                amount: 10000,
                sizeConHeight: 120,
                colorSet: Colors.green,
              ),
              MoneyBox(
                title: "รายจ่าย",
                amount: 80000,
                sizeConHeight: 120,
                colorSet: Colors.orange,
              ),
              MoneyBox(
                title: "ค้างจ่าย",
                amount: 1000,
                sizeConHeight: 120,
                colorSet: Colors.yellow.shade700,
              ),
              Container(
                child: TextButton(
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.green,
                  ),
                  child: Text("button", style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

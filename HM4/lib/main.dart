import 'package:flutter/material.dart';
import 'package:homework4/models/food_menu.dart';

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
      home: const MyHomePage(title: 'Suppakorn Sirikueakunchai 10174'),
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
  List<FoodMenu> menu = [];

  void addMenu() {
    setState(() {
      if (menu.isEmpty) {
        menu.add(FoodMenu(name: "เมนูที่ 1", detail: "รายละเอียดเมนูที่ 1"));
      } else {
        menu.add(
          FoodMenu(
            name: "เมนูที่ ${menu.length + 1}",
            detail: "รายละเอียดเมนูที่ ${menu.length + 1}",
          ),
        );
      }
    });
  }

  void removeMenu() {
    setState(() {
      menu.removeAt(menu.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: menu.isEmpty? :ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          FoodMenu food = menu[index];
          return ListTile(title: Text(food.name), subtitle: Text(food.detail));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: addMenu,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: removeMenu,
            tooltip: 'remove Menu',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

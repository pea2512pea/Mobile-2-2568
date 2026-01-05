import 'package:flutter/material.dart';
import 'package:week4_listview/foodMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'เลือกเมนูอาหาร'),
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
  int number = 0;

  List<foodMenu> menu = [
    foodMenu("กุ้งเผา", "500"),
    foodMenu("กระเพราหมู", "80"),
  ];

  void _incrementCounter() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          foodMenu food = menu[index];
          return ListTile(
            title: Text("เมนูที่ ${index += 1}"),
            subtitle: Text("${food.name} ราคา ${food.price} บาท"),
          );
        },
      ),
    );
  }

  List<Widget> getData(int count) {
    List<Widget> data = [];

    data.add(
      Text(
        "กดปุ่ม เพื่อค่า ตัวเลข",
        style: TextStyle(fontSize: 40, color: Colors.red),
      ),
    );

    data.add(Text(number.toString(), style: TextStyle(fontSize: 60)));

    data.add(Text("ทดสอบ List"));
    data.add(Text("ทดสอบ List"));
    for (var i = 1; i <= count; i++) {
      var menu = ListTile(
        title: Text(
          "เมนูที่ $i",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        subtitle: Text("หัวข้อย่อยที่ $i"),
      );
      data.add(menu);
    }
    return data;
  }
}

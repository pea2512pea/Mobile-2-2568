import 'package:flutter/material.dart';
import 'package:week4_2/foodMenu.dart';

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
      debugShowCheckedModeBanner: false,
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
  List<dynamic> cart = [];
  List<foodMenu> itemInCart = [];
  num total_price = 0;

  List<foodMenu> menu = [
    foodMenu("ข้าวมันไก่", 120, "assets/images/FOOD-PIC/m.jpg", [
      IngredientsModels(name: "ข้าว", amount: '200 กรัม'),
      IngredientsModels(name: "ไก่", amount: '150 กรัม'),
      IngredientsModels(name: "น้ำจิ้ม", amount: '30 กรัม'),
    ], 'ต้ม'),

    foodMenu("สปาเก็ตตี้คาโบนาร่า", 180, "assets/images/FOOD-PIC/m12.jpg", [
      IngredientsModels(name: "เส้นสปาเก็ตตี้", amount: '150 กรัม'),
      IngredientsModels(name: "เบคอน", amount: '50 กรัม'),
      IngredientsModels(name: "ไข่ไก่", amount: '1 ฟอง'),
      IngredientsModels(name: "ครีม", amount: '50 มล'),
    ], 'ผัด'),

    foodMenu("ก๋วยเตี๋ยวเรือ", 70, "assets/images/FOOD-PIC/m13.jpg", [
      IngredientsModels(name: "เส้นก๋วยเตี๋ยว", amount: '200 กรัม'),
      IngredientsModels(name: "หมูสับ", amount: '100 กรัม'),
      IngredientsModels(name: "น้ำซุป", amount: '300 มล'),
    ], 'ต้ม'),

    foodMenu("ยำวุ้นเส้น", 100, "assets/images/FOOD-PIC/m14.jpg", [
      IngredientsModels(name: "วุ้นเส้น", amount: '100 กรัม'),
      IngredientsModels(name: "หมูสับ", amount: '50 กรัม'),
      IngredientsModels(name: "น้ำจิ้มยำ", amount: '30 กรัม'),
      IngredientsModels(name: "ผักชี", amount: '5 กรัม'),
    ], 'ยำ'),

    foodMenu("แกงเขียวหวานไก่", 150, "assets/images/FOOD-PIC/m15.jpg", [
      IngredientsModels(name: "ไก่", amount: '200 กรัม'),
      IngredientsModels(name: "มะเขือ", amount: '50 กรัม'),
      IngredientsModels(name: "พริกแกงเขียวหวาน", amount: '40 กรัม'),
      IngredientsModels(name: "กะทิ", amount: '100 มล'),
    ], 'ต้ม'),

    foodMenu("หมูสะเต๊ะ", 120, "assets/images/FOOD-PIC/m16.jpg", [
      IngredientsModels(name: "หมู", amount: '200 กรัม'),
      IngredientsModels(name: "ไม้สะเต๊ะ", amount: '10 ไม้'),
      IngredientsModels(name: "น้ำจิ้ม", amount: '50 กรัม'),
    ], 'ย่าง'),

    foodMenu("ข้าวผัดปู", 200, "assets/images/FOOD-PIC/m17.jpg", [
      IngredientsModels(name: "ข้าวสวย", amount: '200 กรัม'),
      IngredientsModels(name: "ปู", amount: '100 กรัม'),
      IngredientsModels(name: "ไข่ไก่", amount: '1 ฟอง'),
      IngredientsModels(name: "ซอสปรุงรส", amount: '20 กรัม'),
    ], 'ผัด'),

    foodMenu("หอยแมลงภู่อบเนย", 250, "assets/images/FOOD-PIC/m18.jpg", [
      IngredientsModels(name: "หอยแมลงภู่", amount: '200 กรัม'),
      IngredientsModels(name: "เนย", amount: '50 กรัม'),
      IngredientsModels(name: "กระเทียม", amount: '10 กรัม'),
      IngredientsModels(name: "พริกไทย", amount: '5 กรัม'),
    ], 'อบ'),

    foodMenu("พิซซ่าฮาวายเอี้ยน", 220, "assets/images/FOOD-PIC/m19.jpg", [
      IngredientsModels(name: "แป้งพิซซ่า", amount: '1 แผ่น'),
      IngredientsModels(name: "แฮม", amount: '50 กรัม'),
      IngredientsModels(name: "สับปะรด", amount: '30 กรัม'),
      IngredientsModels(name: "ชีส", amount: '100 กรัม'),
    ], 'อบ'),

    foodMenu("ชาบู", 300, "assets/images/FOOD-PIC/m20.jpg", [
      IngredientsModels(name: "หมูสไลด์", amount: '200 กรัม'),
      IngredientsModels(name: "ผัก", amount: '100 กรัม'),
      IngredientsModels(name: "น้ำซุป", amount: '500 มล'),
    ], 'ต้ม'),

    foodMenu("ทอดมันปลา", 130, "assets/images/FOOD-PIC/m21.jpg", [
      IngredientsModels(name: "ปลา", amount: '150 กรัม'),
      IngredientsModels(name: "แป้งทอด", amount: '30 กรัม'),
      IngredientsModels(name: "เครื่องเทศ", amount: '10 กรัม'),
    ], 'ทอด'),

    foodMenu("ส้มตำ", 60, "assets/images/FOOD-PIC/m22.jpg", [
      IngredientsModels(name: "มะละกอ", amount: '100 กรัม'),
      IngredientsModels(name: "พริก", amount: '10 กรัม'),
      IngredientsModels(name: "น้ำปลา", amount: '10 กรัม'),
      IngredientsModels(name: "น้ำตาลปี๊บ", amount: '10 กรัม'),
    ], 'ยำ'),

    foodMenu("ปูผัดผงกะหรี่", 350, "assets/images/FOOD-PIC/m23.jpg", [
      IngredientsModels(name: "ปู", amount: '200 กรัม'),
      IngredientsModels(name: "ผงกะหรี่", amount: '20 กรัม'),
      IngredientsModels(name: "ไข่", amount: '1 ฟอง'),
      IngredientsModels(name: "พริก", amount: '10 กรัม'),
    ], 'ผัด'),

    foodMenu("ข้าวต้มปลา", 120, "assets/images/FOOD-PIC/m24.jpg", [
      IngredientsModels(name: "ข้าวสวย", amount: '200 กรัม'),
      IngredientsModels(name: "ปลา", amount: '100 กรัม'),
      IngredientsModels(name: "ขิง", amount: '10 กรัม'),
      IngredientsModels(name: "น้ำซุป", amount: '200 มล'),
    ], 'ต้ม'),

    foodMenu("ขนมจีนน้ำยาปู", 180, "assets/images/FOOD-PIC/m25.jpg", [
      IngredientsModels(name: "ขนมจีน", amount: '150 กรัม'),
      IngredientsModels(name: "น้ำยาปู", amount: '200 กรัม'),
      IngredientsModels(name: "ผักสด", amount: '50 กรัม'),
    ], 'ต้ม'),

    foodMenu("น้ำตกหมู", 100, "assets/images/FOOD-PIC/m26.jpg", [
      IngredientsModels(name: "หมู", amount: '150 กรัม'),
      IngredientsModels(name: "ข้าวคั่ว", amount: '10 กรัม'),
      IngredientsModels(name: "น้ำมะนาว", amount: '10 กรัม'),
    ], 'ย่าง'),

    foodMenu("ข้าวเกรียบกุ้ง", 90, "assets/images/FOOD-PIC/m27.jpg", [
      IngredientsModels(name: "กุ้ง", amount: '150 กรัม'),
      IngredientsModels(name: "แป้งข้าวเจ้า", amount: '100 กรัม'),
      IngredientsModels(name: "น้ำมัน", amount: '50 มล'),
    ], 'ทอด'),

    foodMenu("สเต็กเนื้อ", 250, "assets/images/FOOD-PIC/m28.jpg", [
      IngredientsModels(name: "เนื้อวัว", amount: '200 กรัม'),
      IngredientsModels(name: "มันฝรั่ง", amount: '100 กรัม'),
      IngredientsModels(name: "ซอสสเต็ก", amount: '30 กรัม'),
    ], 'ย่าง'),

    foodMenu("เกาเหลา", 50, "assets/images/FOOD-PIC/m29.jpg", [
      IngredientsModels(name: "หมู", amount: '100 กรัม'),
      IngredientsModels(name: "เส้นบะหมี่", amount: '100 กรัม'),
      IngredientsModels(name: "น้ำซุป", amount: '200 มล'),
    ], 'ต้ม'),

    foodMenu("โรตี", 40, "assets/images/FOOD-PIC/m30.jpg", [
      IngredientsModels(name: "แป้ง", amount: '100 กรัม'),
      IngredientsModels(name: "น้ำมัน", amount: '20 มล'),
    ], 'ทอด'),
  ];

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
          List<IngredientsModels> ingredients = food.ingredients;
          return ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(food.img)),
            title: Text("เมนูที่ ${index += 1}"),
            subtitle: Text(
              "${food.name} ราคา ${food.price} บาท\n ประเภท ${food.type}",
            ),
            onTap: () {
              addToCart(food);
              AlertDialog alert = AlertDialog(
                title: Text("คุณเลือกเมนู คือ ${food.name}"),
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pop(context, true),
                    icon: Icon(Icons.arrow_left),
                    splashColor: Colors.black,
                  ),
                ],
                content: SizedBox(
                  width: double.maxFinite, // Fix width
                  height: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("วัตถุดิบ"),
                      SizedBox(
                        width: double.maxFinite,
                        height: 200,
                        child: ListView.builder(
                          itemCount: ingredients.length,
                          itemBuilder: (BuildContext context, int index) {
                            IngredientsModels ingredient = ingredients[index];
                            return ListTile(
                              leading: Text(ingredient.name),
                              trailing: Text(ingredient.amount),
                            );
                          },
                        ),
                      ),
                      Text("เมนูที่เลือกทั้งหมด"),
                      SizedBox(
                        width: double.maxFinite,
                        height: 200,
                        child: ListView.builder(
                          itemCount: cart.length,
                          itemBuilder: (BuildContext context, int index) {
                            dynamic items = cart[index];
                            foodMenu foodItem = items[0];
                            return ListTile(
                              title: Text(foodItem.name),
                              subtitle: Text("x${items[1].toString()}"),
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text("รวมทั้งหมด"),
                          Text("$total_price บาท"),
                        ],
                      ),
                    ],
                  ),
                ),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          );
        },
      ),
    );
  }

  void addToCart(foodMenu food) {
    if (itemInCart.isEmpty) {
      cart.add([food, 1]);
      itemInCart.add(food);
    } else {
      if (itemInCart.contains(food)) {
        for (var item in cart) {
          if (item[0] == food) {
            item[1]++;
          }
        }
      } else {
        cart.add([food, 1]);
        itemInCart.add(food);
      }
    }
    total_price = 0;
    for (var item in cart) {
      foodMenu foodItem = item[0];
      total_price += item[1] * foodItem.price;
    }
  }
}

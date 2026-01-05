class foodMenu {
  String name;
  num price;
  String img;
  String type;
  List<IngredientsModels> ingredients;

  foodMenu(this.name, this.price, this.img, this.ingredients, this.type);
}

class IngredientsModels {
  final String name;
  final String amount;

  IngredientsModels({required this.name, required this.amount});
}

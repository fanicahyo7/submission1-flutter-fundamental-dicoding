class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({this.foods, this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        foods:
            List<Food>.from(json['foods'].map((food) => Food.fromJson(food))),
        drinks: List<Drink>.from(
            json['drinks'].map((drink) => Drink.fromJson(drink))),
      );
}

class Food {
  String name;

  Food({this.name});

  factory Food.fromJson(Map<String, dynamic> json) => Food(name: json['name']);
}

class Drink {
  String name;

  Drink({this.name});

  factory Drink.fromJson(Map<String, dynamic> json) =>
      Drink(name: json['name']);
}

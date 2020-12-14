import 'dart:convert';

class Menu {
  List<Food> foods;
  List<Drink> drinks;

  Menu({this.foods, this.drinks});

  Menu.fromJson(Map<String, dynamic> json) {
    foods = List<Food>.from(json['foods'].map((food) => Food.fromJson(food)));
    drinks =
        List<Drink>.from(json['drinks'].map((drink) => Drink.fromJson(drink)));
  }
}

class Food {
  String name;

  Food({this.name});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

List<Food> getFoods(String json) {
  if (json == null) {
    return [];
  }

  Map<String, dynamic> map = jsonDecode(json);
  List<dynamic> data = map["restaurants"]['menus']['foods'];
  return data.map((json) => Food.fromJson(json)).toList();
}

class Drink {
  String name;

  Drink({this.name});

  Drink.fromJson(Map<String, dynamic> json) {
    name = json[name];
  }
}

import 'dart:convert';

import 'package:submission1_flutter_fundamental_dicoding/models/menu.dart';

class Restaurant {
  String id;
  String name;
  String description;
  String restaurantPicture;
  String city;
  double rate;
  Menu menus;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.restaurantPicture,
      this.city,
      this.rate,
      this.menus});

  Restaurant.fromJson(Map<String, dynamic> resto) {
    id = resto['id'];
    name = resto['name'];
    description = resto['description'];
    restaurantPicture = resto['pictureId'];
    city = resto['city'];
    rate = resto['rating'].toDouble();
    menus = Menu.fromJson(resto['menus']);
  }
}

List<Restaurant> parseRestaurant(String json) {
  if (json == null) {
    return [];
  }

  Map<String, dynamic> map = jsonDecode(json);
  List<dynamic> data = map["restaurants"];
  return data.map((json) => Restaurant.fromJson(json)).toList();
}

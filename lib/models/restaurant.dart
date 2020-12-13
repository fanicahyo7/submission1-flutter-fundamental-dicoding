import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String description;
  String restaurantPicture;
  String city;
  double rate;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.restaurantPicture,
      this.city,
      this.rate});

  Restaurant.fromJson(Map<String, dynamic> resto) {
    id = resto['id'];
    name = resto['name'];
    description = resto['description'];
    restaurantPicture = resto['pictureId'];
    city = resto['city'];
    rate = resto['rating'].toDouble();
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

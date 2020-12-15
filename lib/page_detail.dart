import 'package:flutter/material.dart';
import 'package:submission1_flutter_fundamental_dicoding/models/restaurant.dart';
import 'package:submission1_flutter_fundamental_dicoding/styles.dart';

class PageDetail extends StatelessWidget {
  static const routeName = '/resto_detail';
  final Restaurant restaurant;

  PageDetail(this.restaurant);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: SingleChildScrollView(
            child: Stack(
              children: [
                Hero(
                  tag: restaurant.restaurantPicture,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(restaurant.restaurantPicture),
                            fit: BoxFit.cover)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 56,
                      margin: EdgeInsets.only(top: 20, bottom: 90, left: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.arrow_back,
                                    color: Colors.white))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 140),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              restaurant.name,
                              style: font1.copyWith(fontSize: 24),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.pin_drop),
                              Text(restaurant.city)
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Description',
                                style: font1.copyWith(fontSize: 15),
                              )),
                          Text(
                            restaurant.description,
                            textAlign: TextAlign.justify,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Menu',
                                style: font1.copyWith(fontSize: 15),
                              )),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Foods',
                                style: font1.copyWith(fontSize: 15),
                              )),
                          Container(
                            height: 70,
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: restaurant.menus.foods
                                  .map((e) => Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 120,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                            Colors.amber,
                                            Colors.white
                                          ])),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            e.name,
                                            textAlign: TextAlign.center,
                                            style: font1,
                                            maxLines: 1,
                                          ),
                                        ],
                                      )))
                                  .toList(),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Drinks',
                                style: font1.copyWith(fontSize: 15),
                              )),
                          Container(
                            height: 70,
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: restaurant.menus.drinks
                                  .map((e) => Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 120,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                            Colors.amber,
                                            Colors.white
                                          ])),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            e.name,
                                            textAlign: TextAlign.center,
                                            style: font1,
                                            maxLines: 1,
                                          ),
                                        ],
                                      )))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

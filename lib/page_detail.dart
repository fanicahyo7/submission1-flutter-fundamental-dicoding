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
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(restaurant.restaurantPicture),
                          fit: BoxFit.cover)),
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
                            child: Icon(Icons.arrow_back, color: Colors.white)),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        'Foods',
                                        style: font1.copyWith(fontSize: 15),
                                      )),
                                  Column(
                                    children: restaurant.menus.foods
                                        .map((e) => Text(e.name))
                                        .toList(),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        'Drinks',
                                        style: font1.copyWith(fontSize: 15),
                                      )),
                                  Column(
                                    children: restaurant.menus.drinks
                                        .map((e) => Text(e.name))
                                        .toList(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
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

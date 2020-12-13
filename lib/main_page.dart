import 'package:flutter/material.dart';
import 'package:submission1_flutter_fundamental_dicoding/models/restaurant.dart';
import 'package:submission1_flutter_fundamental_dicoding/styles.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/resto_list';
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
            color: Colors.grey[100],
          )),
          SafeArea(
              child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Restaurant',
                      style: font1.copyWith(fontSize: 30),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 16, bottom: 6),
                      child: Text(
                        'Recommendation restaurant for you!',
                        style: font2.copyWith(fontSize: 14),
                      )),
                  FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/local_restaurant.json'),
                      builder: (context, snapshot) {
                        List<Restaurant> resto = parseRestaurant(snapshot.data);
                        return Column(
                          children: resto
                              .map((e) => _listRestoItem(context, e, resto))
                              .toList(),
                        );
                      }),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}

Widget _listRestoItem(
    BuildContext context, Restaurant restaurant, List<Restaurant> resto) {
  return Card(
    margin:
        EdgeInsets.fromLTRB(16, 12, 16, (restaurant == resto.last) ? 12 : 0),
    elevation: 1,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 6),
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(restaurant.restaurantPicture),
                      fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurant.name),
                Text(restaurant.city),
                Text(restaurant.rate.toString()),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

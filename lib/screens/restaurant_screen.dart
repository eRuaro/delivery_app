import 'package:flutter/material.dart';
import 'package:delivery_app/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({required this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220,
                  //image will resize with regarsd to device width
                  width: MediaQuery.of(context).size.width,
                  //image will expand
                  fit: BoxFit.cover,
                  image: AssetImage(widget.restaurant.imageUrl),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () => Navigator.pop(context), 
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: (){}, 
                      iconSize: 35.0,
                      icon: Icon(Icons.favorite),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

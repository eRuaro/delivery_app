import 'package:delivery_app/widgets/rating_stars.dart';
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    ],
                  ),
                RatingStars(rating: widget.restaurant.rating,),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
               ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: (){}, 
                child: Text('Reviews', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              MaterialButton(
                onPressed: (){}, 
                child: Text('Contact', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

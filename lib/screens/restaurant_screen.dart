import 'package:delivery_app/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/models/restaurant.dart';
import 'package:delivery_app/models/food.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({required this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  menuItem.imageUrl,
                ),
                //Expand to full height of container
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Blackish Gradient
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                //gradient positioning of colors
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

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
                    onPressed: () {},
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
              RatingStars(
                rating: widget.restaurant.rating,
              ),
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
              onPressed: () {},
              child: Text(
                'Reviews',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                'Contact',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Menu',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //Grid View
        Expanded(
          child: GridView.count(
            //2x2 column
            padding: EdgeInsets.all(10),
            crossAxisCount: 2,
            children: List.generate(
              widget.restaurant.menu.length,
              (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              },
            ),
          ),
        ),
      ],
    ));
  }
}

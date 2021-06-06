import 'package:flutter/material.dart';
import 'package:delivery_app/data/data.dart';
import 'package:delivery_app/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
        ),
        actions: [
          TextButton(
            onPressed: (){},
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration( 
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  //sets border color to orange 
                  borderSide: BorderSide(width: 0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: 'Search Food or Restaurant',
                prefixIcon: Icon(Icons.search, size: 30.0,),
                suffixIcon: IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          RecentOrders(),
        ],
      ),
    );
  }
}

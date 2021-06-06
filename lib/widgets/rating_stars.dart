import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐  ';
    }
    //removes extra whitespace at end of string
    stars.trim();
    return Text(
      stars,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }
}

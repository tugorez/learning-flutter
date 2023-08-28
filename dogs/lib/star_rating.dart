import 'package:flutter/material.dart';
import 'package:dogs/star.dart';

class StarRating extends StatelessWidget {
  final Color color;
  final int value;
  final double starSize;

  const StarRating({
    required this.value,
    this.color = Colors.deepOrange,
    this.starSize = 25,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < value; i++)
          Padding(
            padding: EdgeInsets.all(2),
            child: Star(color: color, size: starSize),
          ),
      ],
    );
  }
}

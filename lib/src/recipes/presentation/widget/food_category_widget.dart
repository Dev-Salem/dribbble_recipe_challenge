import 'package:flutter/material.dart';

class FoodCategoryWidget extends StatelessWidget {
  const FoodCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: Alignment.center,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "🔥",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Popular",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

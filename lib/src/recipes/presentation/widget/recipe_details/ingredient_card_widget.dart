import 'package:flutter/material.dart';

class IngredientCardWidget extends StatelessWidget {
  final String ingredient;
  const IngredientCardWidget({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white24, width: 1.5),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        ingredient,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

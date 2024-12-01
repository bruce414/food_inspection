import 'package:flutter/material.dart';
import 'supermarket_label.dart';

class FoodItemContainer extends StatefulWidget {
  const FoodItemContainer({super.key});

  @override
  State<FoodItemContainer> createState() => _FoodItemContainerState();
}

class _FoodItemContainerState extends State<FoodItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        color: Colors.white,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SupermarketLabel(
            labelColor: Colors.yellow,
            labelText: 'P',
          ),
        ],
      ),
    );
  }
}

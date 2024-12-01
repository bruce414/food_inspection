import 'package:flutter/material.dart';

//General Supermarket label
class SupermarketLabel extends StatelessWidget {
  final Color labelColor;
  final String labelText;
  const SupermarketLabel({
    super.key,
    required this.labelColor,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: labelColor,
      ),
      child: Center(
        child: Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}

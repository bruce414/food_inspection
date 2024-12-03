import 'package:flutter/material.dart';

class ManualAddFoodBs extends StatefulWidget {
  const ManualAddFoodBs({super.key});

  @override
  State<ManualAddFoodBs> createState() => _ManualAddFoodBsState();
}

class _ManualAddFoodBsState extends State<ManualAddFoodBs> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 600,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add item',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                  'Varies based on things like your location, the \n'
                      'restaurant, the availability of nearby delivery people and whether you are an Uber One member.'
              ),
            ],
          ),
        ),
      ),
    );
  }
}

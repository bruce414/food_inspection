import 'package:flutter/material.dart';

class ManualAddFoodBs extends StatefulWidget {
  const ManualAddFoodBs({super.key});

  @override
  State<ManualAddFoodBs> createState() => _ManualAddFoodBsState();
}

class _ManualAddFoodBsState extends State<ManualAddFoodBs> {

  Widget _addItemButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Center(
        child: Text(
          'Add Item',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add item',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                  'Varies based on things like your location, the \n'
                      'restaurant, the availability of nearby delivery people and whether you are an Uber One member.'
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _addItemButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

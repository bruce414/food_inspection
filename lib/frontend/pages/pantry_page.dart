import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_inspection/frontend/components/manual_add_food_bs.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0),
                  child: Text(
                    // 'Tracking...',
                    'Pantry',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 260,
                ),
                Center(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/pantry.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Oh, no. Pantry is empty',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 75.0,
        width: 75.0,
        child: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              builder: (BuildContext context) {
                return const ManualAddFoodBs();
              },
            );
          },
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              size: 35.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

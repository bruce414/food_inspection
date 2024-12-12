import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_inspection/frontend/components/manual_add_food_bs.dart';
import 'package:food_inspection/frontend/pages/camera_page.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {

  //TODO: link this page to the pantry_list_item_model provider

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            Positioned(
              top: height - 350,
              left: width - 200,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  width: 170,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            //pop out the dialog, then show the BS.
                            Navigator.pop(context);
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'manually add',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                CupertinoIcons.add,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 0.4,
                          indent: 0,
                          endIndent: 0,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CameraPage()),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'take a picture',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                CupertinoIcons.camera,
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.0, left: 5.0),
                child: Text(
                  // 'Tracking...',
                  'Pantry',
                  style: TextStyle(
                    fontFamily: 'Lobster_Two',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 260,
              // ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 75.0,
        width: 75.0,
        child: FloatingActionButton(
          onPressed: (){
            _showAddItemDialog(context);
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

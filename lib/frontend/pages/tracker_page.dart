import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0),
                  child: Text(
                    // 'Tracking...',
                    'Today',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          // child: Center(
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       const Image(
          //         image: AssetImage('images/empty_list.png'),
          //       ),
          //       const SizedBox(height: 20.0,),
          //       GestureDetector(
          //         onTap: (){},
          //         child: Container(
          //           height: 60,
          //           width: 200,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20.0),
          //             color: Colors.orange,
          //           ),
          //           child: const Center(
          //             child: Text(
          //               'Start tracking',
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 20.0,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

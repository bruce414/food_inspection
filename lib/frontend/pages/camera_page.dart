import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_inspection/frontend/state_management_models/camera_model.dart';

class CameraPage extends ConsumerStatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CameraPage> {
  @override
  void initState() {
    super.initState();
    ref.read(cameraModel.notifier).initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraModel);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            cameraState.isCameraInitialized ?
            Center(
                child: CameraPreview(cameraState.cameraController!)
            ) :
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.camera,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}





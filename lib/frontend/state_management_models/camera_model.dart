import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_inspection/main.dart';

final cameraModel = ChangeNotifierProvider<CameraNotifier>((ref) => CameraNotifier());

class CameraNotifier extends ChangeNotifier {
  late List<CameraDescription> _cameras;
  late CameraController cameraController;
  late CameraDescription mainCamera;
  bool isCameraInitialized = true;

  Future<void> initializeCamera() async {
    try {
      //getting the list of cameras available on the device
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        //assign the first camera of the camera list to be the main camera (or the camera we will be using)
        mainCamera = _cameras[0];
        //create the camera controller
        cameraController = CameraController(mainCamera, ResolutionPreset.max);
      }
      //initialize the camera controller
      await cameraController!.initialize();

      isCameraInitialized = true;
      notifyListeners();
    } catch (e) {
      print("Trouble initializing the camera $e");
      isCameraInitialized = false;
      notifyListeners();
    }

  }

}

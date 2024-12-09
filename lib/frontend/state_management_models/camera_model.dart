import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_inspection/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraState {
  final List<CameraDescription>? cameras;
  final CameraController? cameraController;
  final CameraDescription? mainCamera;
  final bool isCameraInitialized;

  // Constructor to initialize the state
  CameraState({
    this.cameras,
    this.cameraController,
    this.mainCamera,
    this.isCameraInitialized = false,
  });

  // CopyWith method to update specific parts of the state
  CameraState copyWith({
    List<CameraDescription>? cameras,
    CameraController? cameraController,
    CameraDescription? mainCamera,
    bool? isCameraInitialized,
  }) {
    return CameraState(
      cameras: cameras ?? this.cameras,
      cameraController: cameraController ?? this.cameraController,
      mainCamera: mainCamera ?? this.mainCamera,
      isCameraInitialized: isCameraInitialized ?? this.isCameraInitialized,
    );
  }
}

//State notifier approach
class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier() : super(CameraState(isCameraInitialized: false));

  //TODO: ask users permission to access the camera;
  // void checkPermission() async {
  //   PermissionStatus status = await PermissionHandler();
  // }

  Future<void> initializeCamera() async {
    try {
      var cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        print('cameras is not empty');
        var mainCamera = cameras[0];
        var cameraController = CameraController(mainCamera, ResolutionPreset.max);

        await cameraController.initialize();

        state = state.copyWith(
          cameras: cameras,
          cameraController: cameraController,
          mainCamera: mainCamera,
          isCameraInitialized: true,
        );
      } else {
        throw Exception("No camera found");
      }
    } catch (e) {
      print("Trouble initializing the camera: $e");
      state = state.copyWith(isCameraInitialized: false);
    }
  }

  Future<void> capturePhoto() async {
    if (state.cameraController == null || !state.cameraController!.value.isInitialized) {
      throw Exception("Camera has not been initialized");
    }

    try {
      final file = await state.cameraController!.takePicture();


    } catch (e) {
      print("Error capturing photo: $e");
    }
  }

  void disposeCamera() {
    state.cameraController?.dispose();
    state = state.copyWith(
      cameraController: null,
      mainCamera: null,
      isCameraInitialized: false,
    );
  }
}

final cameraModel = StateNotifierProvider<CameraNotifier, CameraState>((ref) => CameraNotifier());

//Change notifier approach
// final cameraModel = ChangeNotifierProvider<CameraNotifier>((ref) => CameraNotifier());
//
// class CameraNotifier extends ChangeNotifier {
//   late List<CameraDescription>? _cameras;
//   CameraController? cameraController;
//   late CameraDescription? mainCamera;
//   bool isCameraInitialized = false;
//
//   Future<void> initializeCamera() async {
//     try {
//       //getting the list of cameras available on the device
//       _cameras = await availableCameras();
//       if (_cameras != null && _cameras!.isNotEmpty) {
//         //assign the first camera of the camera list to be the main camera (or the camera we will be using)
//         mainCamera = _cameras?[0];
//         //create the camera controller
//         cameraController = CameraController(mainCamera!, ResolutionPreset.max);
//       }
//       //initialize the camera controller
//       await cameraController!.initialize();
//
//       isCameraInitialized = true;
//       notifyListeners();
//     } catch (e) {
//       print("Trouble initializing the camera $e");
//       isCameraInitialized = false;
//       notifyListeners();
//     }
//   }
//
//   Future<void> capturePhoto() async {
//     if (cameraController == null || !cameraController!.value.isInitialized) {
//       throw Exception("Camera has not been initialized");
//     }
//     await cameraController!.takePicture();
//     notifyListeners();
//   }
//
//   void disposeCamera() {
//     cameraController?.dispose();
//     cameraController = null;
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     disposeCamera();
//     super.dispose();
//   }
//
// }


// import 'package:flutter/material.dart';
// import 'package:solution_challenge_front/screen/RunModelByCameraDemo.dart';
// import 'package:solution_challenge_front/screen/RunModelByImageDemo.dart';
//
// void main() => runApp(Detection());
//
// class Detection extends StatefulWidget {
//   const Detection({Key? key}) : super(key: key);
//
//   @override
//   State<Detection> createState() => _DetectionState();
// }
//
// class _DetectionState extends State<Detection> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pytorch Mobile Example'),
//       ),
//       body: Builder(
//           builder: (context) {
//             return Center(
//               child: Column(
//                 children: [
//                   TextButton(
//                     onPressed: () => {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => RunModelByCameraDemo()),
//                       )
//                     },
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                     ),
//                     child: Text(
//                       "Run Model with Camera",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () => {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => RunModelByImageDemo()),
//                       )
//                     },
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                     ),
//                     child: Text(
//                       "Run Model with Image",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }
//       ),
//     ),
//   }
// }

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[0], ResolutionPreset.high);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller?.value.isInitialized == true) {
      return Scaffold(
        appBar: AppBar(title: Text('Camera')),
        body: CameraPreview(controller!),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

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
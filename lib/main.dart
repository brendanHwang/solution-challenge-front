import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX 패키지를 가져옵니다
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/screen/home_screen.dart';
import 'package:solution_challenge_front/screen/sign_in_screen.dart';

import 'controller/home_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SignController(), fenix: true);



    return GetMaterialApp( // 여기를 GetMaterialApp으로 변경합니다.
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
      // home: HomeScreen(),
    );
  }
}

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX 패키지를 가져옵니다
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/firebase_options.dart';
import 'package:solution_challenge_front/screen/authentication_wrapper.dart';
import 'controller/home_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 바인딩 초기화 추가
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SignController(), fenix: true);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 감추기
      },
      child: GetMaterialApp(
        // 여기를 GetMaterialApp으로 변경합니다.
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        color: AppColor.primaryColor,

        theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          primarySwatch: Colors.blue,
        ),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sign_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final signController = Get.find<SignController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // 로그아웃 기능 수행
            signController.signOut();
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ),
        title: const Text('settings',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

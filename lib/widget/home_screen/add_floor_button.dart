import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/home_controller.dart';
import 'package:solution_challenge_front/util/firebase_util/floor_util.dart';

class AddFloorButton extends StatefulWidget {
  const AddFloorButton({super.key});

  @override
  _AddFloorButtonState createState() => _AddFloorButtonState();
}

class _AddFloorButtonState extends State<AddFloorButton> {
  final homeController = Get.find<HomeController>(); // 컨트롤러 생성 및 등록

  @override
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.dialog(
          AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('add floor'),
            content: Obx(() {
              return DropdownButton<int>(
                value: homeController.selectedFloor.value,
                onChanged: (newValue) {
                  setState(() {
                    homeController.selectedFloor.value = newValue!;
                  });
                },
                items: homeController.availableFloors
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              );
            }),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('close'),
              ),
              TextButton(
                onPressed: () {
                  // 선택된 층 처리 로직
                  Get.back();
                  homeController.addFloor();
                },
                child: const Text('add'),
              ),
            ],
          ),
        );
      },
      backgroundColor: AppColor.primaryColor,
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}

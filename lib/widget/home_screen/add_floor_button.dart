import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/home_controller.dart';

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
            title: const Text('층 추가'),
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
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  // 선택된 층 처리 로직
                  Get.back();
                  //TODO 층 추가 로직
                  homeController.addFloor();
                },
                child: const Text('확인'),
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

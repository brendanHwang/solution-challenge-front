import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
// 필요한 다른 import 구문

class CameraRegister extends StatelessWidget {
  final TextEditingController _cameraKeyController = TextEditingController();

  CameraRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 키보드 감추기
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // 로고
            const SizedBox(height: 20),
            const Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage('assets/images/logos/logo2.png'),
                height: 200,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: Get.height * 0.4), // 로고와 입력 필드 사이의 공간
                    // 카메라 Key 입력 필드
                    TextFormField(
                      controller: _cameraKeyController,
                      decoration: const InputDecoration(
                        labelText: '카메라 Key',
                        hintText: '카메라 Key 16자리를 입력하세요',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // 추가적인 기능이나 버튼
                    // 예를 들어, 등록 버튼 등
                    SizedBox(
                      width: double.infinity, // 최대 너비 설정
                      child: ElevatedButton(
                        onPressed: () {
                          // 카메라 키 등록 로직
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                        ),
                        child: const Text('카메라 키 등록'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // 카메라 키 등록 안내 문구
                    const Text(

                      '카메라 Key는 방을 생성후 구역을 생성을 통해 발급되는 16자리 문자열입니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,

                      ),
                    ),
                    // 여기에 추가적인 기능이나 링크 배치
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

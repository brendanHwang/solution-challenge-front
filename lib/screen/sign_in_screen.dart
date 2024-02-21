import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/screen/camera_register.dart';
import 'package:solution_challenge_front/screen/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
 SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signController = Get.find<SignController>(); // 컨트롤러 생성 및 등록
    final formKey = GlobalKey<FormState>(); // 폼의 상태를 관리하기 위한 key
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/images/logos/logo2.png'),
              height: 200,
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: Get.height * 0.35), // 로고와 입력 필드 사이의 공간
                        // 이메일 입력 필드
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'email',
                            hintText: 'email@example.com',
                          ),
                          onChanged: (value) {
                            signController.user.value.email = value;
                          },
                        ),
                        const SizedBox(height: 20), // 입력 필드 사이의 공간
                        // 비밀번호 입력 필드
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'password',
                          ),
                          onChanged: (value) {
                            signController.user.value.password = value;
                          },
                        ),
                        const SizedBox(height: 20), // 입력 필드와 버튼 사이의 공간
                        // 로그인 버튼
                        SizedBox(
                          width: double.infinity, // 최대 너비 설정
                          child: ElevatedButton(
                            onPressed: () {
                              signController.signIn();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13)),
                            child: const Text('sign in'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity, // 최대 너비 설정
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() =>  CameraRegister());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13)),
                            child: const Text(
                              'enroll camera',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20), // 버튼 사이의 공간

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {}, child: const Text('forgot ID')),
                            TextButton(
                                onPressed: () {}, child: const Text('forgot password')),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => SignUpScreen());
                                },
                                child: const Text('sign up')),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

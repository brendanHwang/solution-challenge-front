import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/screen/camera_register.dart';
import 'package:solution_challenge_front/screen/home.dart';
import 'package:solution_challenge_front/screen/sign_up_screen.dart';
import 'package:solution_challenge_front/util/pocketbase_util.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signController = Get.find<SignController>(); // 컨트롤러 생성 및 등록
    final formKey = GlobalKey<FormState>(); // 폼의 상태를 관리하기 위한 key
    return GestureDetector(
        onTap: () {
          // 키보드 감추기
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              // 로고
              const SizedBox(
                height: 20,
              ),
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: Get.height * 0.35), // 로고와 입력 필드 사이의 공간
                          // 이메일 입력 필드
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: '이메일 주소',
                              hintText: 'email@example.com',
                            ),
                            onChanged: (value) {
                              signController.email.value = value;
                            },
                          ),
                          const SizedBox(height: 20), // 입력 필드 사이의 공간
                          // 비밀번호 입력 필드
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: '비밀번호',
                            ),
                            onChanged: (value) {
                              signController.password.value = value;
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
                              child: const Text('로그인'),
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
                                '카메라 등록하기',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20), // 버튼 사이의 공간
                          // 네이버 로그인 버튼
                          // ElevatedButton(
                          //   child: const Text('네이버로 로그인'),
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     primary: Colors.green, // 버튼 색상
                          //   ),
                          // ),
                          // const SizedBox(height: 20), // 버튼 사이의 공간
                          // // 애플 로그인 버튼
                          // ElevatedButton.icon(
                          //   icon: const Icon(Icons.apple, color: Colors.white),
                          //   label: const Text('Apple로 로그인'),
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     primary: Colors.black, // 버튼 색상
                          //     onPrimary: Colors.white, // 텍스트 색상
                          //   ),
                          // ),
                          // 기타 로그인 옵션 링크들
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {}, child: const Text('아이디 찾기')),
                              TextButton(
                                  onPressed: () {}, child: const Text('비밀번호 찾기')),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => SignUpScreen());
                                  },
                                  child: const Text('회원가입')),
                            ],
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}

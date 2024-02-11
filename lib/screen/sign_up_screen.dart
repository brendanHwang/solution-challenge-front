import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/screen/sign_in_screen.dart';
import 'package:solution_challenge_front/util/validator.dart';
// 회원 가입 페이지를 위한 추가 import가 필요한 경우 여기에 추가

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 관리하기 위한 key
  final signController = Get.find<SignController>(); // 컨트롤러 생성 및 등록
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: Get.height * 0.35), // 로고와 입력 필드 사이의 공간
                      // 사용자 이름 입력 필드
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: '사용자 이름',
                        ),
                        onChanged: (value) {
                          signController.userName.value = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      // 이메일 입력 필드
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: '이메일 주소',
                          hintText: 'email@example.com',
                        ),
                        onChanged: (value) {
                          signController.email.value = value;
                        },
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 20),
                      // 비밀번호 입력 필드
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: '비밀번호',
                        ),
                        onChanged: (value) {
                          signController.password.value = value;
                        },
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 20),

                      // 비밀번호 확인 입력 필드
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: '비밀번호 확인',
                        ),
                        onChanged: (value) {
                          signController.passwordCheck.value = value;
                        },
                        validator: passwordCheckValidator,
                      ),
                      const SizedBox(height: 20),

                      // 회원 가입 버튼
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO 회원 가입 처리 함수 호출 (pb server)
                              signController.signUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 13),
                          ),
                          child: const Text('회원 가입'),
                        ),
                      ),
                      // 기타 링크들 (예: 로그인 페이지로 돌아가기)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('이미 계정이 있나요?'),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const SignInScreen());
                            },
                            child: const Text('로그인하기'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return '이메일을 입력해주세요';
  }
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'invalid email';
  }
  return null; // 유효한 경우 null 반환
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter password';
  }
  if (value.length < 10) {
    return 'password must be at least 10 characters';
  }
  // 특수 문자를 포함하는지 검사하는 정규 표현식
  String pattern = r'^(?=.*[!@#$%^&*(),.?":{}|<>])';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'password must contain special characters';
  }
  return null; // 유효한 경우 null 반환
}
String? passwordCheckValidator(String? value){
  final signController = Get.find<SignController>();
  if (value == null || value.isEmpty) {
    return 'enter password';
  }
  if (value != signController.user.value.password) {
    return 'password does not match';
  }
  return null; // 유효한 경우 null 반환
}
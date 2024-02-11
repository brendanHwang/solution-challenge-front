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
    return '유효하지 않은 이메일 형식입니다';
  }
  return null; // 유효한 경우 null 반환
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return '비밀번호를 입력해주세요';
  }
  if (value.length < 10) {
    return '비밀번호는 최소 10자 이상이어야 합니다';
  }
  // 특수 문자를 포함하는지 검사하는 정규 표현식
  String pattern = r'^(?=.*[!@#$%^&*(),.?":{}|<>])';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return '비밀번호에는 최소 한 개의 특수 문자가 포함되어야 합니다';
  }
  return null; // 유효한 경우 null 반환
}
String? passwordCheckValidator(String? value){
  final signController = Get.find<SignController>();
  if (value == null || value.isEmpty) {
    return '비밀번호를 입력해주세요';
  }
  if (value != signController.password.value) {
    return '비밀번호가 일치하지 않습니다';
  }
  return null; // 유효한 경우 null 반환
}
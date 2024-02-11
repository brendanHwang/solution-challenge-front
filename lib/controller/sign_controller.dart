import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:solution_challenge_front/util/pocketbase_util.dart' as pb_client;


class SignController extends GetxController{
  final pb = PocketBase('http://127.0.0.1:8090');
  var userName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var passwordCheck = ''.obs;

  // pb authetication server에 회원 가입 요청을 보내는 함수
  void signUp() {
    pb_client.signUp(userName.value, email.value, password.value);
  }

  void signIn() {
    pb_client.signIn(email.value, password.value);
  }
}
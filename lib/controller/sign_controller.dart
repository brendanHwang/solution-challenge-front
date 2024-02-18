import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/model/user_model.dart';
import 'package:solution_challenge_front/util/firebase_util/authentication.dart';


class SignController extends GetxController{
  final user = UserModel(
    id: '',
    name: '',
    email: '',
    password: '',
  ).obs;


  // pb authetication server에 회원 가입 요청을 보내는 함수
  void signUp() {
    firebaseSignup();
  }

  void signIn() {
    firebaseSignin();
  }

  void signOut() {
    firebaseSignout();
  }
}
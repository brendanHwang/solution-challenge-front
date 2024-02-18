import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/firebase_const.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/screen/authentication_wrapper.dart';
import 'package:solution_challenge_front/screen/sign_in_screen.dart';


Future<bool> firebaseSignup() async {
  const String signupCheckSnackTitle = "Error";
  bool success = false;
  SignController signController = Get.find<SignController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    // Firebase를 사용하여 이메일과 비밀번호로 사용자 생성
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: signController.user.value.email,
      password: signController.user.value.password,
    );
    String id = userCredential.user!.uid;

    // 사용자 정보 데이터베이스에 저장
    await FirebaseConst.usersCollection.doc(id).set({
      ...signController.user.value.toJson(),
      'id': id,
      'timestamp': FieldValue.serverTimestamp(),
    });

    Get.to(() => const AuthenticationWrapper());
    Get.snackbar('Success', 'success to sign up');
    success = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.snackbar(signupCheckSnackTitle, "weak password");
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar(signupCheckSnackTitle, "email already in use");
    } else {
      Get.snackbar(signupCheckSnackTitle, e.toString());
    }
  } catch (e) {
    // 기타 예외 처리
    Get.to(() => const AuthenticationWrapper());
    Get.snackbar(signupCheckSnackTitle, "fail to sign up");
    // print(e);
  }
  return success;
}


Future<void> firebaseSignin() async {
  final signController = Get.find<SignController>();
  try {
    final authData = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: signController.user.value.email,
      password: signController.user.value.password,
    );
    if (authData.user != null) {
      Get.to(() => const AuthenticationWrapper());
    }else{
      Get.snackbar('Error', 'fail to sign in');
    }
  } catch (e) {
    Get.snackbar('Error', 'fail to sign in');
  }
}

void firebaseSignout() async {
  try {
    // 1. Firebase 로그아웃
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const SignInScreen());
  } catch (e) {
    Get.snackbar('Error', 'fail to sign out');
  }
}


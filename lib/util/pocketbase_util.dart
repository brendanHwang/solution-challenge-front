import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/screen/home_screen.dart';
import 'package:solution_challenge_front/screen/sign_in_screen.dart';


void signUp(String userName, String email, String password) async {
  final pb = Get.find<SignController>().pb;

  try{
    // fetch a paginated records list
    final body = <String, dynamic>{
      "username": userName,
      "email": email,
      "emailVisibility": true,
      "password": password,
      "passwordConfirm": password,
      "name": userName,
    };
    final record = await pb.collection('users').create(body: body);

    Get.to(() => HomeScreen());
    Get.snackbar('회원 가입', '회원 가입에 성공했습니다.');
  }catch(e){
    Get.snackbar('회원 가입', '회원 가입에 실패했습니다.');
    print(e);
  }
}

void signIn(String email, String password) async {

  final pb = Get.find<SignController>().pb;

  try {

    final authData = await pb.collection('users').authWithPassword(
      email,
      password,
    );

    // after the above you can also access the auth data from the authStore
    if (pb.authStore.isValid) {
      Get.to(() => HomeScreen());
      Get.snackbar('로그인', '로그인에 성공했습니다.');
    }else{
      Get.snackbar('로그인', '로그인에 실패했습니다.');
    }
  } catch (e) {
    Get.snackbar('로그인', '로그인에 실패했습니다.');
    print(e);
  }

}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/firebase_const.dart';
import 'package:solution_challenge_front/model/floor_model.dart';
import 'package:solution_challenge_front/model/section_model.dart';
import 'package:solution_challenge_front/util/firebase_util/floor_util.dart';
import 'package:solution_challenge_front/util/firebase_util/section_util.dart';

class HomeController extends GetxController {
  var selectedFloor = 1.obs; // RxString을 사용하여 반응형 변수로 선언
  final floors = List<FloorModel>.empty(growable: true).obs;
  late final RxList<int> availableFloors;

  @override
  Future<void> onInit() async {
    super.onInit();
    bindFirestoreData();

    availableFloors = getAvailableFloors().obs;
  }

  User? user = FirebaseAuth.instance.currentUser;

  void bindFirestoreData() {
    if (user == null) {
      return;
    } else {
      FirebaseConst.usersCollection
          .doc(user!.uid)
          .collection('floors')
          .snapshots()
          .listen((snapshot) {
        floors.clear();
        snapshot.docs.forEach((doc) {
          final floor = FloorModel.fromJson(doc.data());
          floors.add(floor);
        });
      });
    }
  }

  // 가능 추가 가능한 층을 반환하는 함수
  List<int> getAvailableFloors() {
    // 1부터 1000층까지 가능
    List<int> availableFloors = [];
    for (int i = 1; i <= 999; i++) {
      // floors에 i층이 없으면 availableFloors에 추가
      if (floors.indexWhere((element) => element.num == i) == -1) {
        availableFloors.add(i);
      }
    }

    return availableFloors;
  }

  // 층 추가 함수
  void addFloor() {
    final isValid =
        floors.indexWhere((element) => element.num == selectedFloor.value) ==
            -1;
    if (!isValid) {
      Get.snackbar('Error', 'floor already exists');
      return;
    }
    firebaseAddFloor(floor: selectedFloor.value);
  }

  // 구역 추가 함수
  void addSection({required String floorId, required String sectionName}) {
    // firebase에서 추가
    final section =
        firebaseAddSection(floorId: floorId, sectionName: sectionName);

    // 상태관리에서도 추가
    floors[floors.indexWhere((element) => element.id == floorId)]
        .sections
        .add(section);
  }

  // 구역 삭제 함수
  void deleteSection(
      {required String floorId, required SectionModel sectionModel}) {
    // 상태관리에서도 삭제
    floors[floors.indexWhere((element) => element.id == floorId)]
        .sections
        .remove(sectionModel);
    // firebase에서 삭제
    firebaseDeleteSection(floorId: floorId, sectionModel: sectionModel);
  }
}

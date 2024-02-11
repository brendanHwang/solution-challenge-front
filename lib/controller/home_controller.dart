import 'package:get/get.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/model/floor_model.dart';
import 'package:solution_challenge_front/model/part_model.dart';

class HomeController extends GetxController {
  var selectedFloor = 1.obs; // RxString을 사용하여 반응형 변수로 선언
  final floors = List<FloorModel>.empty(growable: true).obs;
  final availableFloors = <int>[for (int i = 1; i <= 999; i++) i];
  final pb = Get.find<SignController>().pb;

  @override
  Future<void> onInit() async {
    super.onInit();
    final resultList = await pb.collection('floors').getList(
      page: 1,
      perPage: 50,
    );
    print(resultList.items);

    // 층 데이터를 생성하여 floors 변수에 추가
    floors.add(FloorModel(floor: 1, parts: [
      PartModel(floor: 1, part: 'A'),
      PartModel(floor: 1, part: 'C'),
    ]));
    floors.add(FloorModel(floor: 2, parts: [
      PartModel(floor: 2, part: 'A'),
      PartModel(floor: 2, part: 'C'),
    ]));
    floors.add(FloorModel(floor: 3, parts: [
      PartModel(floor: 3, part: 'B'),
      PartModel(floor: 3, part: 'C'),
      PartModel(floor: 3, part: 'D'),
    ]));


    if (!availableFloors.contains(selectedFloor.value)) {
      selectedFloor.value =
          availableFloors.isNotEmpty ? availableFloors.first : 1;
    }
  }

  // 가능 추가 가능한 층을 반환하는 함수
  List<int> getAvailableFloors() {
    // 1부터 1000층까지 가능
    List<int> availableFloors = [];
    for (int i = 1; i <= 999; i++) {
      // floors에 i층이 없으면 availableFloors에 추가
      if (floors.indexWhere((element) => element.floor == i) == -1) {
        availableFloors.add(i);
      }
    }

    print(availableFloors);
    return availableFloors;
  }

  // 층 추가 함수
  void addFloor() {
    final isValid = floors.indexWhere((element) => element.floor == selectedFloor.value) == -1;
    if (!isValid) {
      Get.snackbar('층 추가 실패', '이미 추가된 층입니다.');
      return;
    }
    floors.add(FloorModel(floor: selectedFloor.value, parts: []));
  }
}

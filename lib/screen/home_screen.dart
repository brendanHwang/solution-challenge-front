import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/home_controller.dart';
import 'package:solution_challenge_front/model/part_model.dart';
import 'package:solution_challenge_front/widget/home_screen/add_floor_button.dart';

import 'part_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AddFloorButton(),
        appBar: AppBar(
          title: const Text('00000000 현장',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black, size: 30),
              onPressed: () {
                // 검색 기능 수행
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('안전모 미작용건',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      )),
                  const SizedBox(height: 5),
                  const Text('128',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: const Color(0xffecf5ee),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IntrinsicWidth(
                      // 이 위젯을 사용하여 자식들이 차지할 수 있는 최소한의 가로 공간을 차지하도록 함
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        // 자식 위젯들의 크기에 맞춰 Row의 크기를 최소로 설정
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.yellow[800],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(Icons.arrow_upward,
                                color: Colors.white, size: 15),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            '+ 8.00%',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('작업 현황',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          )),
                      Icon(
                        Icons.filter_list,
                        color: Colors.grey,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView(
                  children: homeController.floors.value.map((floor) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        child: Text(
                          "${floor.floor}층",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: const Text(
                        "A 구역",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: const Text(
                        '작업 인원: 3',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Colors.black54,
                      ),
                      onTap: () {
                        Get.to(() =>
                            PartDetailScreen(part: PartModel(floor: floor.floor, part: 'A 구역')));
                      },
                    );
                  }).toList(),
                );
              }),
            )
          ],
        ));
  }
}

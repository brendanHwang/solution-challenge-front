import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/controller/home_controller.dart';
import 'package:solution_challenge_front/controller/sign_controller.dart';
import 'package:solution_challenge_front/model/section_model.dart';
import 'package:solution_challenge_front/widget/home_screen/add_floor_button.dart';

import 'part_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  final signController = Get.find<SignController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const AddFloorButton(),
        appBar: AppBar(
          title: const Text('hanyang univ construction field',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          leading: IconButton(
            onPressed: () {
              // 로그아웃 기능 수행
              signController.signOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.search, color: Colors.black, size: 30),
          //     onPressed: () {
          //       // 검색 기능 수행
          //     },
          //   ),
          // ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('number of times not wearing a safety helmet',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      )),
                  SizedBox(height: 5),
                  Text('128',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('floor list',
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
                  children: homeController.floors.map((floor) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        child: Text(
                          "${floor.num}F",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        floor.getSectionNames(),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // subtitle: const Text(
                      //   '작업 인원: N명',
                      //   style: TextStyle(
                      //     fontSize: 13,
                      //     fontWeight: FontWeight.w300,
                      //     color: Colors.black54,
                      //   ),
                      // ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Colors.black54,
                      ),
                      onTap: () {
                        Get.to(() => PartDetailScreen(
                            floor: floor));
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

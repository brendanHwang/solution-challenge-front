import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/model/floor_model.dart';
import 'package:solution_challenge_front/model/section_model.dart';
import 'package:solution_challenge_front/util/section_util.dart';

import '../controller/home_controller.dart';

class PartDetailScreen extends StatelessWidget {
  PartDetailScreen({Key? key, required this.floor}) : super(key: key);
  final FloorModel floor;
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
      ),
      floatingActionButton: Tooltip(
        message: 'Add section',
        child: FloatingActionButton(
          onPressed: () async {
            final sectionNameTextFieldController = TextEditingController();
            await Get.dialog(
              AlertDialog(
                title: const Text('Section name'),
                content: TextField(
                  controller: sectionNameTextFieldController,
                  decoration: const InputDecoration(
                    hintText: 'Enter section name',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                      homeController.addSection(
                          floorId: floor.id,
                          sectionName: sectionNameTextFieldController.text);
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            );
          },
          backgroundColor: AppColor.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: floor.sections,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final sections = snapshot.data?.docs
                .map((doc) => SectionModel.fromJson(doc.data()))
                .toList();

            return Column(
              children: [
                ListTile(
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
                  title: Text(sectionNames(sections)),
                ),
                (sections == null || sections.isEmpty)
                    ? const Expanded(
                        child: Center(
                          child: Text('Add section and enroll camera'),
                        ),
                      )
                    : Expanded(
                        child: Container(
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.2),
                            child: ListView.builder(
                              itemCount: sections.length,
                              itemBuilder: (context, index) {
                                final SectionModel section = sections[index];
                                return Card(
                                  key: Key(section.id),
                                  child: ListTile(
                                    title: Text("${section.name} section"),
                                    subtitle: Text(
                                        section.isEnrolled
                                            ? 'Enrolled'
                                            : 'Not enrolled',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        )),
                                    onTap: () {
                                      Get.dialog(
                                        AlertDialog(
                                          content: SizedBox(
                                            height: 40,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text("ID: ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    const SizedBox(width: 10),
                                                    Text(section.id,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                const Text(
                                                    "this is key for camera enroll",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    style: ListTileStyle.list,
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        homeController.deleteSection(
                                            floorId: floor.id,
                                            sectionId: section.id);
                                      },
                                    ),
                                  ),
                                );
                              },
                            )),
                      ),
              ],
            );
          }),
    );
  }
}

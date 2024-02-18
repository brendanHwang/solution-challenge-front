import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/model/floor_model.dart';
import 'package:solution_challenge_front/model/section_model.dart';
import 'package:solution_challenge_front/screen/sign_in_screen.dart';

import '../controller/home_controller.dart';

class PartDetailScreen extends StatefulWidget {
  PartDetailScreen({Key? key, required this.floor}) : super(key: key);

  final FloorModel floor;

  @override
  State<PartDetailScreen> createState() => _PartDetailScreenState();
}

class _PartDetailScreenState extends State<PartDetailScreen> {
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
                      setState(() {
                        homeController.addSection(floorId: widget.floor.id, sectionName: sectionNameTextFieldController.text);
                      });
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            );
            homeController.addSection(
              floorId: widget.floor.id,
              sectionName: sectionNameTextFieldController.text,
            );
          },
          backgroundColor: AppColor.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              child: Text(
                "${widget.floor.num}F",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              widget.floor.getSectionNames(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: null,
          ),

          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.grey.withOpacity(0.2),
            child: widget.floor.sections.isEmpty
                ? const Center(
                    child: Center(child: Text('Add section and enroll camera')),
                  )
                : ListView.builder(
                    itemCount: widget.floor.sections.length,
                    itemBuilder: (context, index) {
                      final SectionModel section = widget.floor.sections[index];
                      return Card(
                        key: Key(section.id),
                        child: ListTile(
                          title: Text("${section.name} section"),
                          subtitle: Text(
                              section.isEnrolled ? 'Enrolled' : 'Not enrolled',
                              style: const TextStyle(
                                fontSize: 12,
                              )),
                          onTap: () {
                              Get.dialog(
                               AlertDialog(
                                    content:  SizedBox(
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text("ID: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                              const SizedBox(width: 10),
                                              Text(section.id, style: const TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          const Text("this is key for camera enroll", style: TextStyle(fontSize: 12, color: Colors.grey)),
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

                              setState(() {
                                homeController.deleteSection(
                                  floorId: widget.floor.id,
                                  sectionModel: section,
                                );
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          )),
        ],
      ),
    );
  }
}

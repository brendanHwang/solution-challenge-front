import 'package:flutter/material.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/model/part_model.dart';

class PartDetailScreen extends StatelessWidget {
  const PartDetailScreen({Key? key, required this.part}) : super(key: key);

  final PartModel part;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColor.primaryColor.withOpacity(0.2),
              child: Text(
                "${part.floor}층",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              part.part,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              '작업 인원: 3명',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            onTap: null,
          ),
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.2),
            child: const Center(child: Text('실시간 ccctv 영상')),
          )
        ],
      ),
    );
  }
}

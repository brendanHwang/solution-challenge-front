import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_front/model/floor_model.dart';
import 'package:solution_challenge_front/model/section_model.dart';

class FloorNameStreamBuilder extends StatelessWidget {
  const FloorNameStreamBuilder({Key? key, required this.floor})
      : super(key: key);

  final FloorModel floor;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: floor.sections,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          return Text(_buildSectionList(snapshot.data.docs));
        });
  }

  // 섹션의 이름을 쉼표로 이어 붙이고, 마지막에 'sections' 단어를 추가하는 메서드
  String _buildSectionList(List<DocumentSnapshot<Map<String, dynamic>>> docs) {
    // SectionModel.fromJson을 사용하여 각 문서를 SectionModel로 변환
    final sectionNames =
        docs.map((doc) => SectionModel.fromJson(doc.data()!).name).toList();

    // 이름들을 쉼표로 결합하고 마지막에 ' sections' 추가
    return '${sectionNames.join(', ')} sections';
  }
}

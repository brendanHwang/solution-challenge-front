import 'package:solution_challenge_front/model/section_model.dart';

class FloorModel {
  final String id;
  final int num;
  final List<SectionModel> sections;

  FloorModel({required this.id, required this.num, required this.sections});

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final floor = json['num'] as int;
    final sections = json['sections'] as List<dynamic>;
    return FloorModel(
      id: id,
      num: floor,
      sections: sections
          .map((section) =>
              SectionModel.fromJson(section as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': num,
      'sections': sections.map((section) => section.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'FloorModel{ id: $id'
        'num: $num, sections: ${sections.map((section) => section.toString()).join(', ')}';
  }

  String getSectionNames() {
    if (sections.isEmpty) {
      return 'there are no sections';
    }

    return '${sections.map((section) => section.name).join(', ')} sections';
  }
}

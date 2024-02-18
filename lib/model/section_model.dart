
class SectionModel {
  String id;
  String name;
  bool isEnrolled;
  SectionModel({
    required this.id, required this.name, this.isEnrolled = false});

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final name = json['name'] as String;
    final isEnrolled = json['isEnrolled'] as bool;
    return SectionModel(
      id: id,
      name: name,
      isEnrolled: isEnrolled,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isEnrolled': isEnrolled,
    };
  }

  @override
  String toString() {
    return 'SectionModel{ id: $id, section: $name, isEnrolled: $isEnrolled}';
  }
}

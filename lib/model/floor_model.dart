import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FloorModel {
  final String id;
  final int num;
  Stream<QuerySnapshot<Map<String, dynamic>>>? sections;

  FloorModel({required this.id, required this.num,  this.sections});

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final floor = json['num'] as int;

    final sections = FirebaseFirestore.instance.collection(
        'users/${FirebaseAuth.instance.currentUser!.uid}/floors/$id/sections').snapshots();
    return FloorModel(
      id: id,
      num: floor,
      sections: sections,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': num,
    };
  }

  @override
  String toString() {
    return 'FloorModel{ id: $id'
        'num: $num';
  }

}

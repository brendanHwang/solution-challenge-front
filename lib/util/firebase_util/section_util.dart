import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_front/model/section_model.dart';

SectionModel firebaseAddSection(
    {required String floorId, required String sectionName}) {
  SectionModel sectionModel = SectionModel(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    name: sectionName,
    isEnrolled: false,
  );
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('floors')
      .doc(floorId)
      .update({
    'sections': FieldValue.arrayUnion([
      sectionModel.toJson()
    ])
  });

  return sectionModel;
}

void firebaseDeleteSection(
    {required String floorId, required SectionModel sectionModel}) {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('floors')
      .doc(floorId)
      .update({
    'sections': FieldValue.arrayRemove(
      [sectionModel.toJson()]
    )
  });

}

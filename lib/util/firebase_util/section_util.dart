import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void firebaseAddSection(
    {required String floorId, required String sectionName}) {
  User? user = FirebaseAuth.instance.currentUser;
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('floors')
      .doc(floorId)
      .collection('sections')
      .doc();

  docRef.set({
    'id': docRef.id,
    'name': sectionName,
    'isEnrolled': false,
  });
}

void firebaseDeleteSection(
    {required String floorId, required String sectionId}) {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('floors')
      .doc(floorId)
      .collection('sections')
      .doc(sectionId)
      .delete();
}

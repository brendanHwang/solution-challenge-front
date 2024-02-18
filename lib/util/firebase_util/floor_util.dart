import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


void firebaseAddFloor({required int floor}) {
  User? user = FirebaseAuth.instance.currentUser;
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('floors')
      .doc();

  docRef.set({'id': docRef.id, 'num': floor, 'sections': []});
}

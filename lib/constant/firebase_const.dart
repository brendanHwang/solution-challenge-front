

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseConst{

//user
  static CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('users');


}
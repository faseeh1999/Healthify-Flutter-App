import 'package:test_app/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // User Collection Reference

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserDate(String name, String email) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
    });
  }
}

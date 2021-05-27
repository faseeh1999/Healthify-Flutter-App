import 'package:test_app/disease.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // User Collection Reference

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // Disease Collection Reference
  final CollectionReference diseaseCollection =
      Firestore.instance.collection('disease');

  Future updateUserDate(String name, String email) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
    });
  }

//convert Query Snapshot to School List
  List<Disease> _diseaseListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Disease(
          image: doc.data['image'] ?? "",
          name: doc.data['name'] ?? "",
          description: doc.data['description'] ?? "",
          symptoms: doc.data['symptoms'] ?? []);
    }).toList();
  }

  // School Stream
  Stream<List<Disease>> get diseases {
    return diseaseCollection.snapshots().map(_diseaseListfromSnapshot);
  }
}

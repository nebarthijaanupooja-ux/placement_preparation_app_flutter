import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/student.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveStudent(Student student, String uid) async {
    await _firestore.collection('users').doc(uid).set({
      ...student.toMap(),
      'uid': uid,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<Student?> getStudent(String uid) async {
    final document =
        await _firestore.collection('users').doc(uid).get();

    if (!document.exists || document.data() == null) {
      return null;
    }

    return Student.fromMap(document.data()!);
  }
}
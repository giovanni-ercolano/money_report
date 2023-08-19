import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirebaseDb {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUsers(UserModel user) async {
    try {
      await _db.collection('users').add(user.toMap());
    } catch (e) {
      print("Error creating user in Firestore: $e");
    }
  }
}

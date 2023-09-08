import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/users/user_model.dart';

class FirebaseDb {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Metodo per creare un nuovo utente nel database
  Future<void> createUsers(UserModel user) async {
    try {
      await _db.collection('users').add(user.toJson());
    } catch (e) {
      print("Error creating user in Firestore: $e");
    }
  }

  // Metodo per ottenere i dati dell'utente dal database
  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot userSnapshot =
          await _db.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        return UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error getting user from Firestore: $e");
    }

    return null;
  }

  // Metodo per aggiornare i dati dell'utente nel database
  Future<void> updateUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toJson());
    } catch (e) {
      print("Error updating user in Firestore: $e");
    }
  }

  //fetch data
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('users').where('email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection('users').get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  //update data

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection('users').doc(user.uid).update(user.toJson());
    print("Aggiornamento dati al db avvenuto");
  }

  Future<void> updateTrandactionRecord(UserModel user) async {
    await _db.collection('users').doc(user.uid).update({
      "transactions": FieldValue.arrayUnion([user.transactionToMap()])
    });
    print("Aggiornamento dati al db avvenuto");
  }
}

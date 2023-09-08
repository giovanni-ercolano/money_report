import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_report/services/firebase_db.dart';
import 'user_model.dart';

class UserController {
  static final UserController instance = UserController();
  final FirebaseDb _firebaseDb = FirebaseDb(); // Crea un'istanza di FirebaseDb

  Future<UserModel?> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final email = user.email;
      if (email != null) {
        return await _firebaseDb
            .getUserDetails(email); // Utilizza l'istanza di FirebaseDb
      } else {
        print("Error getting user from Firestore");
      }
    }
    return null;
  }

  updateRecord(UserModel user) async {
    await _firebaseDb.updateUserRecord(user);
  }

  updateTransactionRecord(UserModel user) async {
    await _firebaseDb.updateTrandactionRecord(user);
  }
}

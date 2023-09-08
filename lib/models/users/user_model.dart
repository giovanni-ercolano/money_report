import 'package:cloud_firestore/cloud_firestore.dart';
import '../transactions/transaction_model.dart';

class UserModel {
  final String? uid;
  final String email;
  final String? photoUrl;
  List<TransactionModel>? transactions = [];
  final double? assets;

  UserModel({
    required this.uid,
    required this.email,
    this.photoUrl,
    this.transactions,
    this.assets,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> transactionsData = json['transactions'] ?? [];
    double assets = (json['assets'] as int?)?.toDouble() ?? 0.0;

    List<TransactionModel> transactions = transactionsData
        .map((transactionMap) => TransactionModel.fromMap(transactionMap))
        .toList();

    return UserModel(
      uid: json['uid'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      transactions: transactions,
      assets: assets,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'photoUrl': photoUrl,
      'transactions':
          transactions?.map((transaction) => transaction.toMap()).toList() ??
              [],
      'assets': assets,
    };
  }

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;

    var response = data["transactions"] as List<dynamic>;
    List<TransactionModel> transactions = response.map((transactionMap) {
      return TransactionModel.fromMap(transactionMap as Map<String, dynamic>);
    }).toList();

    final assetsValue = data['assets'];

    final double assets =
        assetsValue is int ? assetsValue.toDouble() : assetsValue;

    return UserModel(
      uid: document.id,
      email: data["email"],
      transactions: transactions,
      assets: assets,
    );
  }

  Map<String, dynamic> transactionToMap() {
    List<Map<String, dynamic>> transactionsData =
        transactions?.map((transaction) => transaction.toMap()).toList() ?? [];

    return {
      'transactions': transactionsData,
    };
  }
}

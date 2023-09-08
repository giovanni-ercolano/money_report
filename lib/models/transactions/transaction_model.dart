import '../category/category_model.dart';

class TransactionModel {
  final String transactionId;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryModel category;

  TransactionModel({
    required this.transactionId,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    final amountValue = map['amount'];

    // Verifica se amountValue è di tipo int e lo converte in double se necessario
    final double amount =
        amountValue is int ? amountValue.toDouble() : amountValue;

    return TransactionModel(
      transactionId: map['transactionId'],
      title: map['title'],
      amount: amount,
      date: DateTime.parse(map['date']),
      category: CategoryModel.fromMap(map['category']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactionId': transactionId,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category.toMap(),
    };
  }
}

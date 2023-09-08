import '../category/category_model.dart';
import '../transactions/transaction_model.dart';

class DataModel {
  final List<TransactionModel> transactions;
  final List<CategoryModel> categories;
  final double assets;

  DataModel({
    required this.transactions,
    required this.categories,
    required this.assets,
  });

  factory DataModel.fromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>> transactionsData = map['transactions'] ?? [];
    List<Map<String, dynamic>> categoriesData = map['categories'] ?? [];
    double assets = (map['assets'] as int?)?.toDouble() ?? 0.0;

    List<TransactionModel> transactions = transactionsData
        .map((transactionMap) => TransactionModel.fromMap(transactionMap))
        .toList();
    List<CategoryModel> categories = categoriesData
        .map((categoryMap) => CategoryModel.fromMap(categoryMap))
        .toList();

    return DataModel(
      transactions: transactions,
      categories: categories,
      assets: assets,
    );
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> transactionsData =
        transactions.map((transaction) => transaction.toMap()).toList();
    List<Map<String, dynamic>> categoriesData =
        categories.map((category) => category.toMap()).toList();

    return {
      'transactions': transactionsData,
      'categories': categoriesData,
      'assets': assets,
    };
  }

  // valueAssets() {
  //   double assets = 0.0;
  //   for (var transaction in transactions) {
  //     assets += transaction.amount;
  //   }
  //   return assets;
  // }
}

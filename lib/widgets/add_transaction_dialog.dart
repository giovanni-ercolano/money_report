import 'package:flutter/material.dart';
import 'package:money_report/models/transactions/transaction_model.dart';
import 'package:money_report/models/users/user_model.dart';
import '../models/category/category_model.dart';
import '../models/users/user_controller.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _categoryController =
      TextEditingController(); // Campo per il nome della categoria inserito dall'utente

  addTransaction() async {
    String? title = _titleController.text.trim();
    double? amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
    DateTime? date = _selectedDate;
    String? categoryName = _categoryController.text.trim();

    // Creare una nuova transazione
    TransactionModel newTransaction = TransactionModel(
      transactionId: '2', // Sostituisci con un ID univoco
      title: title,
      amount: amount,
      date: date,
      category: CategoryModel(
        categoryId: '2', // Sostituisci con un ID univoco
        name: categoryName,
        iconData:
            Icons.category, // Specifica un'icona o utilizza quella predefinita
      ),
    );

    UserModel? userToUpdate = await UserController.instance.getUserData();

    if (userToUpdate != null) {
      // Ottieni la lista esistente delle transazioni o inizializza una lista vuota se necessario
      List<TransactionModel> existingTransactions =
          userToUpdate.transactions ?? [];

      // Aggiungi la nuova transazione alla lista esistente
      existingTransactions.add(newTransaction);
      print(existingTransactions);
      // Assegna la lista aggiornata all'utente
      userToUpdate.transactions = existingTransactions.cast<TransactionModel>();
      // Salva l'utente aggiornato nel database
      await UserController.instance.updateRecord(userToUpdate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Aggiungi Transazione'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titolo'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Importo'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              children: [
                Text(
                  'Data: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                ),
                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    });
                  },
                  child: const Text(
                    'Scegli Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Categoria'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Annulla'),
        ),
        TextButton(
          onPressed: () {
            addTransaction();

            Navigator.of(context).pop();
          },
          child: const Text('Aggiungi'),
        ),
      ],
    );
  }
}

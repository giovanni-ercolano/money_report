import 'package:flutter/material.dart';
import 'package:money_report/services/screen_size.dart';
import 'package:money_report/styles/app_color.dart';

import '../models/users/user_model.dart';

class HomeCategoryList extends StatefulWidget {
  const HomeCategoryList({Key? key, required this.data}) : super(key: key);

  final UserModel data;

  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends State<HomeCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenSize.padding10, bottom: ScreenSize.padding10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondaryOne, width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListView.builder(
          itemCount: widget.data.transactions?.length,
          itemBuilder: (context, index) {
            final transaction = widget.data.transactions![index];
            return Padding(
              padding: EdgeInsets.only(
                  left: ScreenSize.padding8,
                  right: ScreenSize.padding8,
                  bottom: 0),
              child: ListTile(
                title: Text(
                  transaction.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      widget.data.transactions![index].category.iconData,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      transaction.category.name,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      transaction.date.toUtc().toString().substring(0,10),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  '${transaction.amount.toStringAsFixed(2)} \$',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: transaction.amount < 0.0 ? Colors.red : Colors.green,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

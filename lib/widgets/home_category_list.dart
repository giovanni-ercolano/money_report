import 'package:flutter/material.dart';
import 'package:money_report/styles/app_color.dart';

class HomeCategoryList extends StatefulWidget {
  const HomeCategoryList({super.key});

  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends State<HomeCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.secondaryOne, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Text("HomeCategoryList"),
    );
  }
}

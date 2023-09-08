import 'package:flutter/material.dart';

class CategoryModel {
  final String categoryId;
  final String name;
  final IconData iconData;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.iconData,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'],
      name: map['name'],
      iconData: IconData(map['iconCode'], fontFamily: 'MaterialIcons'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'name': name,
      'iconCode': iconData.codePoint,
    };
  }
}

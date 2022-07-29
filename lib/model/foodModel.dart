import 'package:flutter/material.dart';

class Food {
  final String item;
  final String icon;
  final String quantity;
  final int price;

  Food(
      {required this.item,
      required this.icon,
      required this.quantity,
      required this.price});
}

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String type;
  final String price;
  final IconData icon;
  final Color color;
  final String description;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.icon,
    required this.color,
    required this.description,
    this.quantity = 1,
  });
}

import 'package:flutter/material.dart';

class Medicine {
  final String id;
  final String name;
  final String category;
  final String description;
  final String price;
  final IconData icon;
  final Color color;

  Medicine({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.icon,
    required this.color,
  });
}

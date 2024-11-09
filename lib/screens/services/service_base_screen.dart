import 'package:flutter/material.dart';

// Écran de base pour tous les services avec une structure commune
class ServiceBaseScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Widget body;

  const ServiceBaseScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: body,
    );
  }
}

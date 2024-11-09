import 'package:flutter/material.dart';

class PromotionDetailsScreen extends StatelessWidget {
  const PromotionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promotion Details'),
      ),
      body: const Center(
        child: Text('Promotion details content goes here'),
      ),
    );
  }
}

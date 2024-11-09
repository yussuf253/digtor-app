import 'package:flutter/material.dart';
import '../../screens/search_screen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey[400], size: 22),
              const SizedBox(width: 12),
              Text(
                'Search doctor, drugs, articles...',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

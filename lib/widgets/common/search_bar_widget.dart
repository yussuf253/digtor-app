import 'package:flutter/material.dart';

import '../../screens/search_screen.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final String? searchType;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    this.searchType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(initialSearchType: searchType),
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
                hintText,
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

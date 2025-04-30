import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 28,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.brown.shade400,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

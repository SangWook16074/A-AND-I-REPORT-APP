import 'package:flutter/material.dart';

class ProblemSectionHeader extends StatelessWidget {
  final String label;
  const ProblemSectionHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 16),
        const Divider(color: Color(0xFFF3F4F6), thickness: 1, height: 1),
      ],
    );
  }
}

import 'package:a_and_i_report_web_server/src/feature/home/data/entities/level.dart';
import 'package:flutter/material.dart';

class ProblemLevelBadge extends StatelessWidget {
  final Level level;
  const ProblemLevelBadge({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Lv.',
            style: TextStyle(fontSize: 11, color: Color(0xFF000000)),
          ),
          const SizedBox(width: 4),
          Text(
            level.desc,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}

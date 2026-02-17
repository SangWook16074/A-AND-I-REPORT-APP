import 'package:flutter/material.dart';

class ProblemBulletList extends StatelessWidget {
  final List<String> items;
  const ProblemBulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.fiber_manual_record,
                    size: 10,
                    color: Color(0xFF000000),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF000000),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProblemIOView extends StatelessWidget {
  final List<(String, String)> contents;
  const ProblemIOView({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contents.asMap().entries.map((entry) {
        final index = entry.key + 1;
        final input = entry.value.$1;
        final output = entry.value.$2;
        return _IOExample(index: index, input: input, output: output);
      }).toList(),
    );
  }
}

class _IOExample extends StatelessWidget {
  final int index;
  final String input;
  final String output;

  const _IOExample({
    required this.index,
    required this.input,
    required this.output,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '예제 입력 $index',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Clipboard.setData(ClipboardData(text: input)),
                borderRadius: BorderRadius.circular(6),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.copy, size: 14, color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF3F4F6)),
            ),
            child: SelectableText(
              input,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Color(0xFF000000),
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '예제 출력 $index',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7280),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              output,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

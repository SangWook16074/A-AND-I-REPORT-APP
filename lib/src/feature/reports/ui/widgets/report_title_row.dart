import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/level.dart';
import 'package:flutter/material.dart';

class ReportTitleRow extends StatelessWidget {
  final ReportSummary reportSummary;
  final String indexLabel;
  final bool isDone;

  const ReportTitleRow({
    super.key,
    required this.reportSummary,
    required this.indexLabel,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 20,
        vertical: isMobile ? 12 : 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  indexLabel,
                  style: TextStyle(
                    color: const Color(0xFF9CA3AF),
                    fontSize: isMobile ? 12 : 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    reportSummary.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFF111827),
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          _difficultyLabel(),
          const SizedBox(width: 12),
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? const Color(0xFF22C55E) : const Color(0xFFD1D5DB),
            size: isMobile ? 20 : 24,
          ),
        ],
      ),
    );
  }

  Widget _difficultyLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'DIFFICULTY',
          style: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          _difficultyText(reportSummary.level),
          style: TextStyle(
            color: _difficultyColor(reportSummary.level),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }

  String _difficultyText(Level level) {
    switch (level) {
      case Level.LOW:
        return 'LOW';
      case Level.MEDIUM:
        return 'MID';
      case Level.HIGH:
        return 'HIGH';
      case Level.VERYHIGH:
        return 'VERY HIGH';
    }
  }

  Color _difficultyColor(Level level) {
    switch (level) {
      case Level.LOW:
        return const Color(0xFF6B7280);
      case Level.MEDIUM:
        return const Color(0xFF059669);
      case Level.HIGH:
        return const Color(0xFF4B5563);
      case Level.VERYHIGH:
        return const Color(0xFFB91C1C);
    }
  }
}

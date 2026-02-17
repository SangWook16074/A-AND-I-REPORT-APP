import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/cs_report_list_view.dart';
import 'package:flutter/material.dart';

/// CS 과제 뷰
class CsReportView extends StatelessWidget {
  const CsReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveLayout.isMobile(context) ? 16 : 20,
        horizontal: ResponsiveLayout.isMobile(context) ? 14 : 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 8),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(context),
          SizedBox(height: ResponsiveLayout.isMobile(context) ? 16 : 20),
          const CsReportListView(),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6,
                height: isMobile ? 32 : 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "기초 CS 과정",
                      style: TextStyle(
                        color: const Color(0xFF111827),
                        fontSize: isMobile ? 22 : 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Computer Science Fundamentals",
                      style: TextStyle(
                        color: const Color(0xFF9CA3AF),
                        fontSize: isMobile ? 12 : 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0xFFE4E4E7)),
          ),
          child: const Text(
            'ACTIVE',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ],
    );
  }
}

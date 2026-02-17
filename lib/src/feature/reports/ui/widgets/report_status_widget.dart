import 'package:flutter/material.dart';

enum ReportStatueType {
  done("종료"),
  progress("진행중");

  final String status;

  const ReportStatueType(this.status);

  factory ReportStatueType.fromEndAt(DateTime time) {
    final now = DateTime.now().add(const Duration(hours: 9)).toUtc();

    if (now.difference(time).inSeconds > 0) {
      return ReportStatueType.done;
    } else {
      return ReportStatueType.progress;
    }
  }
}

class ReportStatus extends StatelessWidget {
  final ReportStatueType type;
  const ReportStatus({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ReportStatueType.done:
        return _basic(
          backgroundColor: const Color(0xFFF4F4F5),
          borderColor: const Color(0xFFE4E4E7),
          textColor: const Color(0xFF71717A),
        );
      case ReportStatueType.progress:
        return _basic(
          backgroundColor: const Color(0xFFECFDF3),
          borderColor: const Color(0xFFA7F3D0),
          textColor: const Color(0xFF059669),
        );
    }
  }

  Widget _basic({
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1, color: borderColor),
        ),
        alignment: Alignment.center,
        child: Text(
          type.status,
          style: TextStyle(
            color: textColor,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.7,
          ),
        ),
      );
}

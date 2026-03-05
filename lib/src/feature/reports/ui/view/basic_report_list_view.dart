import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/course_by_slug_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasicReportListView extends ConsumerWidget {
  static const String _courseSlug = 'fl-basic';

  const BasicReportListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseBySlugViewModelProvider(_courseSlug));

    return courseAsync.when(
      data: (course) => _CourseInfoView(course: course),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text(
          '오류가 발생했습니다: ${error.toString()}',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class _CourseInfoView extends StatelessWidget {
  final Course course;

  const _CourseInfoView({required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.metadata.title,
          style: const TextStyle(
            color: Color(0xFF111827),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          course.metadata.description,
          style: const TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '기간: ${course.startDate} ~ ${course.endDate}',
          style: const TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/course_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// CS 과제 목록 뷰
class CsReportListView extends ConsumerWidget {
  const CsReportListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseListAsync = ref.watch(courseListViewModelProvider);

    return courseListAsync.when(
      data: (courses) {
        Course? csCourse;
        for (final course in courses) {
          if (_isCsCourse(course)) {
            csCourse = course;
            break;
          }
        }

        if (csCourse == null) {
          return _EmptyCourseView();
        }
        return _CourseInfoView(course: csCourse);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text(
          '조회 가능한 코스가 없습니다.',
          style: TextStyle(
            color: const Color(0xffAFAFAF),
            fontSize: ResponsiveLayout.isMobile(context) ? 13 : 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  bool _isCsCourse(Course course) {
    final slug = course.slug.toLowerCase();
    final title = course.metadata.title.toLowerCase();
    final description = course.metadata.description.toLowerCase();
    final fieldTag = course.fieldTag.toLowerCase();
    final targetTrack = (course.targetTrack ?? '').toLowerCase();

    return slug.contains('cs') ||
        slug.contains('back') ||
        title.contains('cs') ||
        description.contains('computer science') ||
        fieldTag == 'cs' ||
        targetTrack == 'cs';
  }
}

class _EmptyCourseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: Text(
          '조회 가능한 코스가 없습니다.',
          style: TextStyle(
            color: const Color(0xffAFAFAF),
            fontSize: ResponsiveLayout.isMobile(context) ? 13 : 15,
            fontWeight: FontWeight.w500,
          ),
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
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.metadata.title,
          style: TextStyle(
            color: const Color(0xFF111827),
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          course.metadata.description,
          style: TextStyle(
            color: const Color(0xFF6B7280),
            fontSize: isMobile ? 12 : 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '기간: ${course.startDate} ~ ${course.endDate}',
          style: TextStyle(
            color: const Color(0xFF6B7280),
            fontSize: isMobile ? 12 : 13,
          ),
        ),
      ],
    );
  }
}

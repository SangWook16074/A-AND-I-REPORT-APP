import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/course_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasicReportListView extends ConsumerWidget {
  const BasicReportListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseListAsync = ref.watch(courseListViewModelProvider);

    return courseListAsync.when(
      data: (courses) {
        Course? basicCourse;
        for (final course in courses) {
          if (_isBasicCourse(course)) {
            basicCourse = course;
            break;
          }
        }

        if (basicCourse == null) {
          return _EmptyCourseView();
        }
        return _CourseInfoView(course: basicCourse);
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

  bool _isBasicCourse(Course course) {
    final slug = course.slug.toLowerCase();
    final title = course.metadata.title.toLowerCase();
    final description = course.metadata.description.toLowerCase();
    final phase = (course.phase ?? course.metadata.phase).toLowerCase();

    return phase == 'basic' ||
        slug.contains('basic') ||
        title.contains('basic') ||
        description.contains('basic') ||
        description.contains('기초');
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

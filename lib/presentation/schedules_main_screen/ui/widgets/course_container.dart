import 'package:flutter/material.dart';
import 'package:mediasoft_academy_flutter/data/net/model/schedules_main_response_model.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({
    super.key,
    required this.course,
  });
  final CoursesItem course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        color: Colors.white,
        key: Key(course.code),
        elevation: 10,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(course.title),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('${course.status}'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(course.description),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/features/home/data/models/course_model.dart';

class MyCoursesRepo {
  final sup = Supabase.instance.client;
  final userId = Supabase.instance.client.auth.currentUser!.id;
  List<CourseModel> courses = [];
  Future<Either<String, List<CourseModel>>> getMyCourses() async {
    try {
      final response = await sup
          .from('Enrollments')
          .select('courses(*)')
          .eq('user_id', userId);

      for (var course in response) {
        courses.add(CourseModel.fromJson(course['courses']));
      }
      return right(courses);
    } catch (e) {
      return left(e.toString());
    }
  }
}

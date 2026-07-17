import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/features/home/data/models/course_model.dart';

class HomeRepo {
  List<CourseModel> courses = [];

  Future<Either<String, List<CourseModel>>> getCourses() async {
    try {
      courses = [];
      final response = await Supabase.instance.client.from('courses').select();
      courses = [];
      for (var course in response) {
        courses.add(CourseModel.fromJson(course));
      }
      return right(courses);
    } catch (e) {
      return left(e.toString());
    }
  }
}

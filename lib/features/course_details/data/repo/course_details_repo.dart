import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final sup = Supabase.instance.client;
  Future<Either<String, void>> enrollCourse(courseId, userId) async {
    try {
      await Supabase.instance.client.from('Enrollments').insert({
        'course_id': courseId,
        'user_id': userId,
      });
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> checkEnrollment({
    required courseId,
    required userId,
  }) async {
    try {
      final response =
          await sup
              .from('Enrollments')
              .select()
              .eq('course_id', courseId)
              .eq('user_id', userId)
              .maybeSingle();
      return right(response != null);
    } catch (e) {
      return left(e.toString());
    }
  }
}

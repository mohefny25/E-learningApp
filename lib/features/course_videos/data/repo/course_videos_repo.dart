import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/features/course_videos/data/model/course_video_model.dart';

class CourseVideosRepo {
  final sup = Supabase.instance.client;
  Future<Either<String, List<CourseVideoModel>>> getCourseVideos({
    required String courseId,
  }) async {
    try {
      final response = await sup
          .from('videos')
          .select()
          .eq("course_id", courseId);
      final List<CourseVideoModel> courseVideos = [];
      for (var courseVideo in response) {
        courseVideos.add(CourseVideoModel.fromSupabase(courseVideo));
      }
      return right(courseVideos);
    } catch (e) {
      return left(e.toString());
    }
  }
}

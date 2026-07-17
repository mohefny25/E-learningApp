import 'package:your_academy/features/course_videos/data/model/course_video_model.dart';

abstract class CourseVideosState {}

class CourseVideosInitialState extends CourseVideosState {}

class GetCourseVideosLoadingState extends CourseVideosState {}

class GetCourseVideosSuccessState extends CourseVideosState {
  final List<CourseVideoModel> courseVideos;
  GetCourseVideosSuccessState({required this.courseVideos});
}

class GetCourseVideosErrorState extends CourseVideosState {
  final String error;
  GetCourseVideosErrorState({required this.error});
}

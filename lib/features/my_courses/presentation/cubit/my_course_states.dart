import 'package:your_academy/features/home/data/models/course_model.dart';

abstract class MyCoursesState {}

class MyCoursesInitialState extends MyCoursesState {}

class GetMyCoursesLoadingState extends MyCoursesState {}

class GetMyCoursesSuccessState extends MyCoursesState {
  final List<CourseModel> courses;
  GetMyCoursesSuccessState({required this.courses});
}

class GetMyCoursesErrorState extends MyCoursesState {
  final String error;
  GetMyCoursesErrorState({required this.error});
}

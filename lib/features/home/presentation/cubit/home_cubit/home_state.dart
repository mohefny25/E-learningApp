import 'package:your_academy/features/home/data/models/course_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<CourseModel> courses;
  SuccessHomeState({required this.courses});
}

class ErrorHomeState extends HomeState {
  final String error;
  ErrorHomeState({required this.error});
}

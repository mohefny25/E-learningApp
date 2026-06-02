import 'package:your_academy/features/home/data/models/course_model.dart';
import 'package:your_academy/features/home/data/models/user_model.dart';

abstract class HomeState{}

class InitialHomeState extends HomeState{}

class LoadingHomeState extends HomeState{}
class SuccessHomeState extends HomeState{
  final List<CourseModel> courses;
  SuccessHomeState({required this.courses});
}
class ErrorHomeState extends HomeState{
  final String error;
  ErrorHomeState({required this.error});
}
class LoadingUserState extends HomeState{}
class SuccessUserState extends HomeState{
  final List<UserModel> users;
  SuccessUserState({required this.users});
}
class ErrorUserState extends HomeState{
  final String error;
  ErrorUserState({required this.error});
}

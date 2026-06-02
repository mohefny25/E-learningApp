import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/features/home/data/models/course_model.dart';
import 'package:your_academy/features/home/data/models/user_model.dart';

class HomeRepo{

    List<CourseModel> courses=[];

  Future<Either<String,List<CourseModel>>> getCourses() async {
    try {
      courses=[];
      final response = await Supabase
          .instance
          .client
          .from('courses')
      .select();
      courses=[];
      for(var course in response){
        courses.add(CourseModel.fromJson(course));
      }
      return right(courses);
    }  catch (e) {
      return left(e.toString());
    }

  }
  List<UserModel> users= [];
   Future<Either<String,List<UserModel>>> getUserDetails() async {

    try {
      final response = await Supabase.instance.client
          .from('users').select();
      users.clear();
      for(var user in response){
        users.add(UserModel.fromJson(user));
      }
      return right(users);
    } catch (e) {
      return left(e.toString());
    }
   }
// }
}
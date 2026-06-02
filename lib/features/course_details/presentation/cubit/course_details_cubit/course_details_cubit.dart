import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/course_details/data/repo/course_details_repo.dart';
import 'package:your_academy/features/course_details/presentation/cubit/course_details_cubit/course_detailse_states.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState>{
  final CourseDetailsRepo courseDetailsRepo;
  CourseDetailsCubit(this.courseDetailsRepo):super(EnrollInitialState());
  static CourseDetailsCubit get(context)=>BlocProvider.of(context);

  Future<void>enrollCourse(courseId,userId) async {
    final response = await courseDetailsRepo
        .enrollCourse(courseId, userId);
    response.fold(
        (error){emit(EnrollErrorState(error));},
        (success){emit(EnrollSuccessState());}
    );




  }
  Future<void> checkEnrollment({
    required courseId,
    required userId
}) async {
    final response = await courseDetailsRepo.checkEnrollment(courseId: courseId, userId: userId);
    response.fold(
        (error){emit(EnrollErrorState(error));},
        (isEnrolled){
          if(isEnrolled){
            emit(AlreadyEnrolledState());
          }else {
            emit(NotEnrolledState());
          }
        }
    );

  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:your_academy/features/my_courses/presentation/cubit/my_course_states.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit(this.myCoursesRepo) : super(MyCoursesInitialState());
  final MyCoursesRepo myCoursesRepo;
  static MyCoursesCubit get(context) => BlocProvider.of(context);

  Future<void> getMyCourses() async {
    emit(GetMyCoursesLoadingState());
    final response = await myCoursesRepo.getMyCourses();
    response.fold(
      (error) {
        emit(GetMyCoursesErrorState(error: error));
      },
      (courses) {
        emit(GetMyCoursesSuccessState(courses: courses));
      },
    );
  }
}

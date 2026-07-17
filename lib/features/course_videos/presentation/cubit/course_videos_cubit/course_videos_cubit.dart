import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/course_videos/data/repo/course_videos_repo.dart';
import 'package:your_academy/features/course_videos/presentation/cubit/course_videos_cubit/course_videos_states.dart';

class CourseVideosCubit extends Cubit<CourseVideosState> {
  CourseVideosCubit(this.courseVideosRepo) : super(CourseVideosInitialState());

  CourseVideosCubit get(context) => BlocProvider.of(context);

  final CourseVideosRepo courseVideosRepo;

  Future<void> getCourseVideos(courseId) async {
    emit(GetCourseVideosLoadingState());
    final response = await courseVideosRepo.getCourseVideos(courseId: courseId);
    response.fold(
      (error) {
        emit(GetCourseVideosErrorState(error: error));
      },
      (videos) {
        emit(GetCourseVideosSuccessState(courseVideos: videos));
      },
    );
  }
}

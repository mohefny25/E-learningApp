import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/home/data/repo/home_repo.dart';
import 'package:your_academy/features/home/presentation/cubit/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(InitialHomeState());

  Future<void> getCourses() async {
    emit(LoadingHomeState());
    final response = await homeRepo.getCourses();
    response.fold(
      (errMsg) {
        emit(ErrorHomeState(error: errMsg));
      },
      (courses) {
        emit(SuccessHomeState(courses: courses));
      },
    );
  }
}

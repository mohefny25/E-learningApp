import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/home/presentation/screens/home_screen.dart';
import 'package:your_academy/features/layout/presentation/cubit/layout_cubit/layout_states.dart';
import 'package:your_academy/features/my_courses/presentation/screens/my_courses_screen.dart';
import 'package:your_academy/features/profile/presentation/screens/profile_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialBotNavIndexState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [HomeScreen(), MyCoursesScreen(), ProfileScreen()];

  changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBotNavIndexState());
  }
}

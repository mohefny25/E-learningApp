import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/core/constants/app_colors.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/theme/app_radius.dart';
import 'package:your_academy/core/theme/text_styles.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/features/course_videos/presentation/screens/course_videos_screen.dart';
import 'package:your_academy/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:your_academy/features/my_courses/presentation/cubit/my_course_states.dart';
import 'package:your_academy/features/my_courses/presentation/cubit/my_courses_cubit.dart';
import 'package:your_academy/l10n/app_localizations.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => MyCoursesCubit(MyCoursesRepo())..getMyCourses(),
      child: BlocConsumer<MyCoursesCubit, MyCoursesState>(
        listener: (context, state) {
          if (state is GetMyCoursesErrorState) {
            Center(child: Text(l10n.somethingWrong));
            snackBarMessage(
              context: context,
              text: l10n.somethingWrong,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                l10n.subscribedCourses,
                style: AppTextStyles.s20w700(context),
              ),
              centerTitle: true,
              leading: SizedBox(),
              backgroundColor: AppColors.primaryColor,
            ),
            body:
                state is GetMyCoursesLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : state is GetMyCoursesSuccessState
                    ? state.courses.isEmpty
                        ? Center(child: Text(l10n.notEnrolledYet))
                        : ListView.builder(
                          itemCount: state.courses.length,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.r15,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: height * 0.02,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              AppRadius.r5,
                                            ),
                                            child: Image.network(
                                              state.courses[index].image,
                                              fit: BoxFit.fill,
                                              height: height * 0.12,
                                              width: width * 0.35,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(state.courses[index].title),
                                            SizedBox(
                                              width: width * 0.45,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.03,
                                                ),
                                                child: CustomButton(
                                                  text: l10n.completeCourse,
                                                  onPressed: () {
                                                    navigateTo(
                                                      context,
                                                      CourseVideosScreen(
                                                        courseId:
                                                            state
                                                                .courses[index]
                                                                .id,
                                                      ),
                                                    );
                                                  },
                                                  isSmall: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:your_academy/core/constants/app_colors.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/theme/app_radius.dart';
import 'package:your_academy/core/theme/text_styles.dart';
import 'package:your_academy/features/course_videos/data/repo/course_videos_repo.dart';
import 'package:your_academy/features/course_videos/presentation/cubit/course_videos_cubit/course_videos_cubit.dart';
import 'package:your_academy/features/course_videos/presentation/cubit/course_videos_cubit/course_videos_states.dart';
import 'package:your_academy/features/course_videos/presentation/screens/video_player_screen.dart';
import 'package:your_academy/l10n/app_localizations.dart';

class CourseVideosScreen extends StatelessWidget {
  const CourseVideosScreen({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create:
          (context) =>
              CourseVideosCubit(CourseVideosRepo())..getCourseVideos(courseId),
      child: BlocConsumer<CourseVideosCubit, CourseVideosState>(
        listener: (context, state) {
          if (state is GetCourseVideosErrorState) {
            snackBarMessage(
              context: context,
              text: state.error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: Text(
                l10n.courseVideos,
                style: AppTextStyles.s20w700(context),
              ),
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            body:
                state is GetCourseVideosLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : state is GetCourseVideosErrorState
                    ? Center(child: Text(state.error))
                    : state is GetCourseVideosSuccessState
                    ? state.courseVideos.isEmpty
                        ? Center(child: Text(l10n.noVideosYet))
                        : ListView.builder(
                          physics: ScrollPhysics(),
                          itemCount: state.courseVideos.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * .03,
                                vertical: height * .015,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(
                                    AppRadius.r15,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.032,
                                    vertical: height * 0.016,
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          AppRadius.r5,
                                        ),
                                        child: Image.network(
                                          state.courseVideos[index].image ??
                                              'https://img.magnific.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
                                          height: height * 0.08,
                                          width: width * 0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Gap(width * 0.04),
                                      Column(
                                        children: [
                                          Text(
                                            state.courseVideos[index].title,
                                            style: AppTextStyles.s16w400(
                                              context,
                                            ).copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            state.courseVideos[index].desc ??
                                                "",
                                            style: AppTextStyles.s12w600(
                                              context,
                                            ).copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff64748B),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          navigateTo(
                                            context,
                                            VideoPlayerScreen(
                                              courseVideoModel:
                                                  state.courseVideos[index],
                                            ),
                                          );
                                        },
                                        child: CircleAvatar(
                                          radius: 13,
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          child: Image.asset(
                                            "assets/images/videos_icon.png",
                                          ),
                                        ),
                                      ),
                                    ],
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/core/constants/app_colors.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/theme/text_styles.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/features/course_details/data/repo/course_details_repo.dart';
import 'package:your_academy/features/course_details/presentation/cubit/course_details_cubit/course_details_cubit.dart';
import 'package:your_academy/features/course_details/presentation/cubit/course_details_cubit/course_detailse_states.dart';
import 'package:your_academy/features/home/data/models/course_model.dart';
import 'package:your_academy/l10n/app_localizations.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.course});
  final CourseModel course;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create:
          (context) => CourseDetailsCubit(CourseDetailsRepo())..checkEnrollment(
            courseId: widget.course.id,
            userId: Supabase.instance.client.auth.currentUser!.id,
          ),
      child: BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
        listener: (context, state) {
          if (state is EnrollErrorState) {
            snackBarMessage(
              context: context,
              text: state.error,
              color: Colors.red,
            );
          }
          if (state is EnrollSuccessState) {
            snackBarMessage(
              context: context,
              text: l10n.enrolledSuccess,
              color: Colors.green,
            );
          }
        },
        builder: (context, state) {
          CourseDetailsCubit cubit = CourseDetailsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              elevation: 0,
              title: Text(
                l10n.courseDetails,
                style: AppTextStyles.s20w700(context),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: width * 0.03,
                horizontal: height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.course.image,
                    width: double.infinity,
                    height: height * 0.2,
                    fit: BoxFit.fill,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.error, size: 50, color: Colors.red),
                        ),
                  ),
                  Gap(height * 0.04),
                  Text(
                    widget.course.title,
                    style: AppTextStyles.s24w600(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: adaptiveTextColor(
                        context,
                        AppColors.cardTitleColor,
                      ),
                    ),
                  ),
                  state is EnrollInitialState
                      ? SizedBox()
                      : (state is AlreadyEnrolledState ||
                          state is EnrollSuccessState)
                      ? SizedBox()
                      : Gap(height * 0.02),
                  state is EnrollInitialState
                      ? SizedBox()
                      : (state is AlreadyEnrolledState ||
                          state is EnrollSuccessState)
                      ? SizedBox()
                      : Text(
                        l10n.priceWithCurrency(
                          formatPrice(context, widget.course.price),
                        ),
                        style: AppTextStyles.s20w700(
                          context,
                        ).copyWith(color: AppColors.detailsCostColor),
                      ),
                  Gap(height * 0.04),
                  Text(
                    l10n.description,
                    style: AppTextStyles.s18w600(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: adaptiveTextColor(
                        context,
                        AppColors.cardTitleColor,
                      ),
                    ),
                  ),
                  Gap(height * 0.04),
                  Text(widget.course.desc),
                  Spacer(),
                  state is EnrollInitialState
                      ? SizedBox()
                      : state is EnrollLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                        text:
                            (state is AlreadyEnrolledState ||
                                    state is EnrollSuccessState)
                                ? l10n.enrolled
                                : l10n.enrollCourse,
                        onPressed: () async {
                          if (state is EnrollErrorState ||
                              state is NotEnrolledState) {
                            cubit.enrollCourse(
                              widget.course.id,
                              Supabase.instance.client.auth.currentUser!.id,
                            );
                          }
                        },
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/core/constants/app_colors.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/routing/routes.dart';
import 'package:your_academy/core/theme/text_styles.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/features/course_videos/presentation/screens/course_videos_screen.dart';
import 'package:your_academy/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:your_academy/features/my_courses/presentation/cubit/my_course_states.dart';
import 'package:your_academy/features/my_courses/presentation/cubit/my_courses_cubit.dart';
import 'package:your_academy/features/my_courses/presentation/screens/widgets/my_course_item.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
  create: (context) => MyCoursesCubit(MyCoursesRepo())..getMyCourses(),
  child: BlocConsumer<MyCoursesCubit, MyCoursesState>(
  listener: (context, state) {
    if(state is GetMyCoursesErrorState){
      Center(child: Text('Something wrong'));
      snackBarMessage(context: context, text: "Something wrong", color: Colors.red);
    }
  },
  builder: (context, state) {
    MyCoursesCubit cubit =MyCoursesCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribed courses',style: AppTextStyles.s20w700(context),),
        centerTitle: true,
        leading: SizedBox(),
        backgroundColor: AppColors.primaryColor,
      ),
      body:
          state is GetMyCoursesLoadingState?
        Center(child: CircularProgressIndicator(),) :
              state is GetMyCoursesSuccessState?
        state.courses.isEmpty?
        Center(child: Text("Not Enrolled course yet")):
               ListView.builder(
        itemCount: state.courses.length,
          physics: ScrollPhysics(),
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: height*0.02),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(state.courses[index].image,
                          fit: BoxFit.fill,
                          height: height*0.12,
                          width: width*0.35,),
                      ),
                    ),
                    Column(
                      children: [
                        Text(state.courses[index].title),
                        SizedBox(
                          width: width*0.45,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                            child: CustomButton(
                              text: 'complete course',
                              onPressed: (){
                                navigateTo(
                                    context,
                                    CourseVideosScreen(
                                        courseId: state.courses[index].id));
                              },
                              isSmall: true,),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }):SizedBox(),
    );
  },
),
);
  }
}



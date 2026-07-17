import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/home/data/repo/home_repo.dart';
import 'package:your_academy/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:your_academy/features/home/presentation/cubit/home_cubit/home_state.dart';
import 'package:your_academy/features/home/presentation/screens/widgets/grid_view_item.dart';
import 'package:your_academy/features/home/presentation/screens/widgets/home_top_logo.dart';
import 'package:your_academy/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeTopLogo(height: height, width: width, name: l10n.guest),

            BlocProvider(
              create: (context) => HomeCubit(HomeRepo())..getCourses(),
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadingHomeState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is ErrorHomeState) return Text(state.error);
                  if (state is SuccessHomeState) {
                    return GridView.builder(
                      physics: ScrollPhysics(),

                      shrinkWrap: true,
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) {
                        final course = state.courses[index];
                        return GridViewItem(
                          height: height,
                          width: width,
                          image: course.image,
                          title: course.title,
                          price: course.price,
                          course: course,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 3,
                        childAspectRatio: 17 / 18,
                      ),
                    );
                  }
                  return Center(child: Text(l10n.noCoursesFound));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

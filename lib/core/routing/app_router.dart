import 'package:flutter/material.dart';
import 'package:your_academy/core/routing/routes.dart';
import 'package:your_academy/features/auth/presentation/screens/login_screen.dart';
import 'package:your_academy/features/auth/presentation/screens/signup_screen.dart';
import 'package:your_academy/features/course_details/presentation/screens/course_details_screen.dart';
import 'package:your_academy/features/home/data/models/course_model.dart';
import 'package:your_academy/features/home/presentation/screens/home_screen.dart';
import 'package:your_academy/features/layout/presentation/screens/layout_screen.dart';
import 'package:your_academy/features/my_courses/presentation/screens/my_courses_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SignupScreen();
          },
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );
      case AppRoutes.layoutScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LayoutScreen();
          },
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
      case AppRoutes.myCoursesScreen:
        return MaterialPageRoute(
          builder: (context) {
            return MyCoursesScreen();
          },
        );
      // case AppRoutes.courseVideosScreen:
      //   final courseId = settings.arguments
      //   return MaterialPageRoute(
      //       builder: (context){
      //         return CourseVideosScreen();
      //       });
      case AppRoutes.courseDetailsScreen:
        final course = settings.arguments as CourseModel;
        return MaterialPageRoute(
          builder: (context) {
            return CourseDetailsScreen(course: course);
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("No route defined for ${settings.name}"),
              ),
            );
          },
        );
    }
  }
}

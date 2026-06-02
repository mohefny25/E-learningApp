abstract class CourseDetailsState{}

class EnrollInitialState extends CourseDetailsState{}

class EnrollLoadingState extends CourseDetailsState{}
class EnrollSuccessState extends CourseDetailsState{}
class EnrollErrorState extends CourseDetailsState{
  final String error;
  EnrollErrorState(this.error);
}
class AlreadyEnrolledState extends CourseDetailsState{}
class NotEnrolledState extends CourseDetailsState{}
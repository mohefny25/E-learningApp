// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signUpLink => 'Sign up';

  @override
  String get logInLink => 'Log In';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get enterYourFullName => 'Enter your full Name';

  @override
  String get forgetPassword => 'forget password';

  @override
  String get orContinueWith => 'or continue with';

  @override
  String get orSignUpWith => 'or sign up with';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get pleaseEnterYourEmail => 'please enter your email';

  @override
  String get pleaseEnterValidEmail => 'please enter valid email';

  @override
  String get pleaseEnterYourPassword => 'please enter your password';

  @override
  String get pleaseEnterYourName => 'please enter your name';

  @override
  String get passwordTooShort => 'your password must not be less than 6';

  @override
  String get success => 'success';

  @override
  String greeting(String name) {
    return 'Hi, $name';
  }

  @override
  String welcomeMessage(String appName) {
    return 'Welcome to $appName';
  }

  @override
  String get searchHint => 'what are you looking for?';

  @override
  String get guest => 'Guest';

  @override
  String get noCoursesFound => 'No courses found';

  @override
  String get home => 'Home';

  @override
  String get myCourses => 'My Courses';

  @override
  String get courseDetails => 'Course Details';

  @override
  String get enrolledSuccess => 'Enrolled Success';

  @override
  String get description => 'Description';

  @override
  String get enrolled => 'Enrolled';

  @override
  String get enrollCourse => 'Enroll course';

  @override
  String priceWithCurrency(String price) {
    return 'EGP $price';
  }

  @override
  String get courseVideos => 'course videos';

  @override
  String get noVideosYet => 'No Videos yet';

  @override
  String get subscribedCourses => 'Subscribed courses';

  @override
  String get notEnrolledYet => 'Not Enrolled course yet';

  @override
  String get completeCourse => 'complete course';

  @override
  String get somethingWrong => 'Something wrong';

  @override
  String get profile => 'Profile';

  @override
  String get noUserData => 'No user data found';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get retry => 'Retry';

  @override
  String get premiumMember => 'Premium Member';

  @override
  String get accountSettings => 'ACCOUNT SETTINGS';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get changePassword => 'Change Password';

  @override
  String get learning => 'Learning';

  @override
  String get myCertificates => 'My Certificates';

  @override
  String get purchaseHistory => 'Purchase History';

  @override
  String get logOut => 'Log Out';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get showDetails => 'Show Details';

  @override
  String get name => 'Name';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get profileUpdatedSuccess => 'Profile updated successfully!';
}

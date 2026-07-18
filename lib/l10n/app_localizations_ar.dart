// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signUpLink => 'إنشاء حساب';

  @override
  String get logInLink => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get enterYourEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور';

  @override
  String get enterYourFullName => 'أدخل اسمك الكامل';

  @override
  String get forgetPassword => 'نسيت كلمة المرور';

  @override
  String get orContinueWith => 'أو تابع باستخدام';

  @override
  String get orSignUpWith => 'أو سجّل باستخدام';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get pleaseEnterYourEmail => 'الرجاء إدخال بريدك الإلكتروني';

  @override
  String get pleaseEnterValidEmail => 'الرجاء إدخال بريد إلكتروني صالح';

  @override
  String get pleaseEnterYourPassword => 'الرجاء إدخال كلمة المرور';

  @override
  String get pleaseEnterYourName => 'الرجاء إدخال اسمك';

  @override
  String get passwordTooShort => 'يجب ألا تقل كلمة المرور عن 6 أحرف';

  @override
  String get success => 'تم بنجاح';

  @override
  String greeting(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String welcomeMessage(String appName) {
    return 'مرحبًا بك في $appName';
  }

  @override
  String get searchHint => 'عمّاذا تبحث؟';

  @override
  String get guest => 'ضيف';

  @override
  String get noCoursesFound => 'لا توجد دورات';

  @override
  String get home => 'الرئيسية';

  @override
  String get myCourses => 'دوراتي';

  @override
  String get courseDetails => 'تفاصيل الدورة';

  @override
  String get enrolledSuccess => 'تم التسجيل بنجاح';

  @override
  String get description => 'الوصف';

  @override
  String get enrolled => 'مسجّل';

  @override
  String get enrollCourse => 'سجّل في الدورة';

  @override
  String priceWithCurrency(String price) {
    return 'EGP $price';
  }

  @override
  String get courseVideos => 'فيديوهات الدورة';

  @override
  String get noVideosYet => 'لا توجد فيديوهات بعد';

  @override
  String get subscribedCourses => 'الدورات المشترك بها';

  @override
  String get notEnrolledYet => 'لم تسجّل في أي دورة بعد';

  @override
  String get completeCourse => 'أكمل الدورة';

  @override
  String get somethingWrong => 'حدث خطأ ما';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get noUserData => 'لا توجد بيانات مستخدم';

  @override
  String errorWithMessage(String message) {
    return 'خطأ: $message';
  }

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get premiumMember => 'عضو مميّز';

  @override
  String get accountSettings => 'إعدادات الحساب';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get learning => 'التعلّم';

  @override
  String get myCertificates => 'شهاداتي';

  @override
  String get purchaseHistory => 'سجل المشتريات';

  @override
  String get logOut => 'تسجيل الخروج';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get showDetails => 'عرض التفاصيل';

  @override
  String get name => 'الاسم';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get profileUpdatedSuccess => 'تم تحديث الملف الشخصي بنجاح!';
}

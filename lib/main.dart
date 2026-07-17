import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/core/networking/supabase_services.dart';
import 'package:your_academy/core/routing/app_router.dart';
import 'package:your_academy/core/routing/routes.dart';
import 'package:your_academy/core/theme/app_themes.dart';
import 'package:your_academy/core/widgets/bloc_observer.dart';

//طريقة إضافة video من drive
//http://drive.google.com/uc?export=download&id=(اكتب هنا id)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.init();
  runApp(const MyApp());
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YOUR ACADEMY',
      theme: AppThemes.lightTheme,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: AppRoutes.signUpScreen,
    );
  }
}

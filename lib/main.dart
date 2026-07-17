import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/core/constants/app_strings.dart';
import 'package:your_academy/core/localization/locale_cubit.dart';
import 'package:your_academy/core/localization/locale_states.dart';
import 'package:your_academy/core/networking/supabase_services.dart';
import 'package:your_academy/core/routing/app_router.dart';
import 'package:your_academy/core/routing/routes.dart';
import 'package:your_academy/core/shared_pref/cache_helper.dart';
import 'package:your_academy/core/theme/app_themes.dart';
import 'package:your_academy/core/theme/theme_cubit.dart';
import 'package:your_academy/core/theme/theme_states.dart';
import 'package:your_academy/core/widgets/bloc_observer.dart';
import 'package:your_academy/l10n/app_localizations.dart';

//طريقة إضافة video من drive
//http://drive.google.com/uc?export=download&id=(اكتب هنا id)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.init();
  // Initialize local storage before the UI so the saved theme can be restored
  // synchronously on the first frame (avoids a light→dark startup flicker).
  await CacheHelper.init();
  // Reuse the persisted Supabase session: if one was restored during init, skip
  // the auth screens and open the app directly on the layout.
  final String initialRoute =
      SupabaseServices.hasActiveSession
          ? AppRoutes.layoutScreen
          : AppRoutes.signUpScreen;
  runApp(MyApp(initialRoute: initialRoute));
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.initialRoute = AppRoutes.signUpScreen});

  final String initialRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: themeState.themeMode,
                locale: localeState.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                onGenerateRoute: AppRouter().generateRoute,
                initialRoute: initialRoute,
              );
            },
          );
        },
      ),
    );
  }
}

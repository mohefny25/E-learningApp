import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/routing/routes.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/features/edit_profile/presentation/screens/edit_profile_screen.dart';
import 'package:your_academy/features/profile/data/repo/profile_repo.dart';
import 'package:your_academy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:your_academy/l10n/app_localizations.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../cubit/profile_states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final userId = Supabase.instance.client.auth.currentUser!.id;
    final userEmail = Supabase.instance.client.auth.currentUser!.email;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create:
          (context) =>
              ProfileCubit(profileRepo: ProfileRepo())..getUsers(userId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(l10n.profile, style: AppTextStyles.s20w700(context)),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is GetUserErrorState) {
              snackBarMessage(
                context: context,
                text: state.error,
                color: Colors.red,
              );
            }
          },
          builder: (context, state) {
            if (state is GetUserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is GetUserErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(l10n.errorWithMessage(state.error)),
                    ElevatedButton(
                      onPressed: () {
                        final userId =
                            Supabase.instance.client.auth.currentUser!.id;
                        context.read<ProfileCubit>().getUsers(userId);
                      },
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              );
            }

            if (state is GetUserSuccessState) {
              if (state.users.isEmpty) {
                return Center(child: Text(l10n.noUserData));
              }

              final user = state.users[0];

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.03 * width,
                    vertical: 0.015 * height,
                  ),
                  child: Column(
                    children: [
                      Card(
                        elevation: 5,

                        child: Container(
                          height: height * 0.15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.r5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(user.name),
                              Text(
                                Supabase
                                        .instance
                                        .client
                                        .auth
                                        .currentUser
                                        ?.email ??
                                    "",
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.25,
                                ),
                                child: CustomButton(
                                  isProfile: true,
                                  isSmall: true,
                                  text: l10n.premiumMember,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(height * 0.02),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.accountSettings,
                              style: AppTextStyles.s12w600(context).copyWith(
                                color: Color(0xff64748B),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(height * 0.02),
                            InkWell(
                              onTap: () {
                                navigateTo(
                                  context,
                                  EditProfileScreen(
                                    name: user.name,
                                    email: userEmail.toString(),
                                    password: '',
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.025,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: height * 0.05,
                                      width: height * 0.05,
                                      decoration: BoxDecoration(
                                        color: AppColors.profileSecondaryColor,
                                        borderRadius: BorderRadius.circular(
                                          AppRadius.r5,
                                        ),
                                      ),

                                      child: Icon(
                                        Icons.person_outline,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    Gap(width * 0.04),
                                    Text(l10n.editProfile),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios, size: 10),
                                  ],
                                ),
                              ),
                            ),
                            Gap(height * 0.04),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.025,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    width: height * 0.05,
                                    decoration: BoxDecoration(
                                      color: AppColors.profileSecondaryColor,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.r5,
                                      ),
                                    ),

                                    child: Icon(
                                      Icons.person_outline,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Gap(width * 0.04),
                                  Text(l10n.changePassword),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, size: 10),
                                ],
                              ),
                            ),
                            Gap(height * 0.04),
                            Builder(
                              builder: (context) {
                                final isDark =
                                    Theme.of(context).brightness ==
                                    Brightness.dark;
                                return InkWell(
                                  onTap: () {
                                    ThemeCubit.get(context).setThemeMode(
                                      isDark ? ThemeMode.light : ThemeMode.dark,
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.025,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.05,
                                          width: height * 0.05,
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.profileSecondaryColor,
                                            borderRadius: BorderRadius.circular(
                                              AppRadius.r5,
                                            ),
                                          ),
                                          child: Icon(
                                            isDark
                                                ? Icons.dark_mode_outlined
                                                : Icons.light_mode_outlined,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        Gap(width * 0.04),
                                        Text(
                                          isDark
                                              ? l10n.darkMode
                                              : l10n.lightMode,
                                        ),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios, size: 10),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Gap(height * 0.04),
                            Builder(
                              builder: (context) {
                                final isArabic =
                                    Localizations.localeOf(
                                      context,
                                    ).languageCode ==
                                    'ar';
                                return InkWell(
                                  onTap:
                                      () =>
                                          _showLanguageSelector(context, l10n),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.025,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.05,
                                          width: height * 0.05,
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.profileSecondaryColor,
                                            borderRadius: BorderRadius.circular(
                                              AppRadius.r5,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.language,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        Gap(width * 0.04),
                                        Text(
                                          isArabic ? l10n.arabic : l10n.english,
                                        ),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios, size: 10),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Gap(height * 0.02),
                            Text(
                              l10n.learning,
                              style: AppTextStyles.s12w600(context).copyWith(
                                color: Color(0xff64748B),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(height * 0.02),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.025,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    width: height * 0.05,
                                    decoration: BoxDecoration(
                                      color: AppColors.profileSecondaryColor,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.r5,
                                      ),
                                    ),

                                    child: Icon(
                                      Icons.person_outline,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Gap(width * 0.04),
                                  Text(l10n.myCertificates),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, size: 10),
                                ],
                              ),
                            ),
                            Gap(height * 0.04),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.025,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    width: height * 0.05,
                                    decoration: BoxDecoration(
                                      color: AppColors.profileSecondaryColor,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.r5,
                                      ),
                                    ),

                                    child: Icon(
                                      Icons.person_outline,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Gap(width * 0.04),
                                  Text(l10n.purchaseHistory),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, size: 10),
                                ],
                              ),
                            ),
                            Gap(height * 0.04),
                            CustomButton(
                              text: l10n.logOut,
                              onPressed: () async {
                                await Supabase.instance.client.auth.signOut();
                                if (!context.mounted) return;
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.loginScreen,
                                  (route) => false,
                                );
                              },
                              prefixIcon: Icon(Icons.logout),
                              isLogOut: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  /// Shows a Material bottom sheet to pick the app language. Selection is
  /// applied and persisted through the existing [LocaleCubit], highlights the
  /// current language, and closes automatically after choosing.
  void _showLanguageSelector(BuildContext context, AppLocalizations l10n) {
    final cubit = LocaleCubit.get(context);
    final current = cubit.locale.languageCode;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        Widget option(String label, Locale locale) {
          final selected = current == locale.languageCode;
          return ListTile(
            title: Text(label),
            selected: selected,
            selectedColor: AppColors.primaryColor,
            trailing:
                selected
                    ? Icon(Icons.check, color: AppColors.primaryColor)
                    : null,
            onTap: () {
              cubit.setLocale(locale);
              Navigator.pop(sheetContext);
            },
          );
        }

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              option(l10n.english, LocaleCubit.english),
              option(l10n.arabic, LocaleCubit.arabic),
            ],
          ),
        );
      },
    );
  }
}

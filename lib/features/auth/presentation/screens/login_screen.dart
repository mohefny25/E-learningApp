import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/routing/routes.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/features/auth/data/repo/auth_repo/auth_repo.dart';
import 'package:your_academy/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:your_academy/features/auth/presentation/screens/signup_screen.dart';
import 'package:your_academy/features/auth/presentation/screens/widgets/text_before_tff.dart';
import 'package:your_academy/features/auth/presentation/screens/widgets/top_logo.dart';
import 'package:your_academy/l10n/app_localizations.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/auth_cubit/auth_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            snackBarMessage(
              context: context,
              text: state.errMsg,
              color: Colors.red,
            );
          }
          if (state is LoginSuccessState) {
            snackBarMessage(
              context: context,
              text: l10n.success,
              color: Colors.green,
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.layoutScreen,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TopLogo(height: height, secondHeader: l10n.login),
                  Gap(height * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: Form(
                      key: loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBeforeTextFormField(text: l10n.email),
                          Gap(height * 0.005),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.pleaseEnterYourEmail;
                              }
                              if (!value.contains('@')) {
                                return l10n.pleaseEnterValidEmail;
                              }
                              return null;
                            },
                            controller: emailController,
                            label: l10n.enterYourEmail,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Gap(height * .03),
                          TextBeforeTextFormField(text: l10n.password),
                          Gap(height * 0.005),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.pleaseEnterYourPassword;
                              }
                              if (value.length < 6) {
                                return l10n.passwordTooShort;
                              }
                              return null;
                            },
                            controller: passwordController,
                            isPassword: true,
                            label: l10n.enterYourPassword,
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                l10n.forgetPassword,
                                style: TextStyle(color: Color(0xff9CA3AF)),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Gap(height * 0.02),
                          state is LoginLoadingState
                              ? Center(child: CircularProgressIndicator())
                              : CustomButton(
                                text: l10n.login,
                                onPressed: () {
                                  if (loginFormKey.currentState!.validate()) {
                                    context.read<AuthCubit>().signin(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                              ),
                          Gap(height * 0.02),
                          Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Color(0xffE2E8F0),
                                    height: 1,
                                  ),
                                ),
                                Gap(width * 0.04),

                                Text(
                                  l10n.orContinueWith,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Gap(width * 0.04),
                                Expanded(
                                  child: Container(
                                    color: Color(0xffE2E8F0),
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/google.png"),
                              Gap(width * 0.1),
                              Image.asset("assets/images/facebook.png"),
                              Gap(width * 0.1),

                              Image.asset("assets/images/apple.png"),
                            ],
                          ),
                          Gap(height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l10n.dontHaveAccount,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff64748B),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  navigateTo(context, SignupScreen());
                                },
                                child: Text(
                                  " ${l10n.signUpLink}",
                                  style: TextStyle(
                                    color: Color(0xff3B71D8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:your_academy/core/constants/app_colors.dart';
import 'package:your_academy/core/theme/text_styles.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/features/auth/data/repo/auth_repo/auth_repo.dart';
import 'package:your_academy/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:your_academy/features/auth/presentation/cubit/auth_cubit/auth_states.dart';
import 'package:your_academy/features/auth/presentation/screens/login_screen.dart';
import 'package:your_academy/features/auth/presentation/screens/widgets/text_before_tff.dart';
import 'package:your_academy/features/auth/presentation/screens/widgets/top_logo.dart';

import '../../../../core/functions.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController =TextEditingController();

  final emailController =TextEditingController();

  final passwordController =TextEditingController();

  final signupFormKey = GlobalKey<FormState>();

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



    return BlocProvider(
  create: (context) => AuthCubit(AuthRepo()),
  child: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is SignUpErrorState){
      snackBarMessage(context: context, text: state.errMsg,color: Colors.red);
    }
    if(state is SignUpSuccessState){
      snackBarMessage(context: context, text: "success",color: Colors.green);
      navigateToAndReplace(context, LoginScreen());
    }
  },
  builder: (context, state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopLogo(height: height, secondHeader: 'Sign Up',),
            Gap(height * 0.04),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.08),
              child: Form(
                key: signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBeforeTextFormField(text: 'Full Name',),
                    Gap(height * 0.004),
                    CustomTextFormField(
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter your name';
                        }
                        return null;
                      },
                      controller: nameController,
                      label: 'Enter your full Name',
                      prefixIcon: Icon(Icons.person_outline,color: AppColors.iconColor,),),
                    Gap(height *.03),
                    TextBeforeTextFormField(text: 'Email',),
                    Gap(height * 0.005),
                    CustomTextFormField(
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter your email';
                        }
                        if(!value!.contains('@')){
                          return 'please enter valid email';
                        }
        
                        return null;
                      },
                      controller: emailController,
                      label: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined,color: AppColors.iconColor,),),
                    Gap(height *.03),
                    TextBeforeTextFormField(text: 'Password',),
                    Gap(height * 0.005),
                    CustomTextFormField(
                      isPassword: true,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter your password';
                        }
                        if(value.length<6){
                          return 'your password must not be less than 6';                        }
                        return null;
                      },
                      controller: passwordController,
                      label: 'Enter your password',
                      prefixIcon: Icon(Icons.lock_outline_rounded,color: AppColors.iconColor,),),
                    Gap(height*0.03),
                    state is SignUpLoadingState?
                    CircularProgressIndicator()
                        :CustomButton(
                      text: "Sign Up",
                      onPressed: (){
                        if(signupFormKey.currentState!.validate()){
                          context.read<AuthCubit>().signup(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(), name: nameController.text.trim());
        
                        }
                      },),
                    Gap(height*0.02),
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xffE2E8F0),
                              height: 1,
        
                            ),
                          ),
                          Gap(width*0.04),
        
                          Text("or sign up with",style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                          ),),
                          Gap(width*0.04),
                          Expanded(
                            child: Container(
                              color: Color(0xffE2E8F0),
                              height: 1,
        
                            ),
                          ),
        
                        ],
                      ),
                    ),
                    Gap(height*0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png"),
                        Gap(width*0.1),
                        Image.asset("assets/images/facebook.png"),
                        Gap(width*0.1),
        
                        Image.asset("assets/images/apple.png"),
        
                      ],
                    ),
                    Gap(height*0.04),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff64748B)
                          ),),
                        InkWell(
                            onTap: (){
                              navigateTo(context, LoginScreen());
                            },
                            child: Text(" Log In",
                              style: TextStyle(
                                  color: Color(0xff3B71D8),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14
                              ),))
                      ],
                    )
        
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




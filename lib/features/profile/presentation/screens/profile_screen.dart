import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/features/auth/presentation/screens/login_screen.dart';
import 'package:your_academy/features/edit_profile/presentation/screens/edit_profile_screen.dart';
import 'package:your_academy/features/profile/data/repo/profile_repo.dart';
import 'package:your_academy/features/profile/presentation/cubit/profile_cubit.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../cubit/profile_states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final userId = Supabase.instance.client.auth.currentUser!.id;
    final userEmail = Supabase.instance.client.auth.currentUser!.email;

    return BlocProvider(
      create: (context) => ProfileCubit(profileRepo: ProfileRepo())..getUsers(userId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text('Profile', style: AppTextStyles.s20w700(context)),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is GetUserErrorState) {
              snackBarMessage(context: context, text: state.error, color: Colors.red);
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
                    Text('Error: ${state.error}'),
                    ElevatedButton(
                      onPressed: () {
                        final userId = Supabase.instance.client.auth.currentUser!.id;
                        context.read<ProfileCubit>().getUsers(userId);
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state is GetUserSuccessState) {
              if (state.users.isEmpty) {
                return const Center(child: Text('No user data found'));
              }

              final user = state.users[0];

              return Padding(
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

                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(user.name),
                            Text(Supabase.instance.client.auth.currentUser?.email ?? ""),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.25),
                              child: CustomButton(
                                isProfile: true,
                                isSmall: true,
                                text: 'Premium Member',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(height*0.02),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ACCOUNT SETTINGS',style: AppTextStyles.s12w600(context).copyWith(
                            color: Color(0xff64748B),
                            fontWeight: FontWeight.w700
                          ),),
                          Gap(height*0.02),
                          InkWell(
                            onTap: (){
                              navigateTo(context, EditProfileScreen(
                                name: user.name,
                                email: userEmail.toString(),
                                password: '',));
                            },
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.025),
                              child: Row(
                                children: [
                                  Container(
                                    height: height*0.05,
                                    width: height*0.05,
                                    decoration:BoxDecoration(
                                      color: AppColors.profileSecondaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                            
                                      child: Icon(Icons.person_outline,color: AppColors.primaryColor,)),
                                  Gap(width*0.04),
                                  Text('Edit Profile'),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,size: 10,)
                                ],
                              ),
                            ),
                          ),
                          Gap(height*0.04),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.025),
                            child: Row(
                              children: [
                                Container(
                                    height: height*0.05,
                                    width: height*0.05,
                                    decoration:BoxDecoration(
                                      color: AppColors.profileSecondaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),

                                    child: Icon(Icons.person_outline,color: AppColors.primaryColor,)),
                                Gap(width*0.04),
                                Text('Change Password'),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,size: 10,)
                              ],
                            ),
                          ),
                          Gap(height*0.02),
                          Text('Learning',style: AppTextStyles.s12w600(context).copyWith(
                              color: Color(0xff64748B),
                              fontWeight: FontWeight.w700
                          ),),
                          Gap(height*0.02),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.025),
                            child: Row(
                              children: [
                                Container(
                                    height: height*0.05,
                                    width: height*0.05,
                                    decoration:BoxDecoration(
                                      color: AppColors.profileSecondaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),

                                    child: Icon(Icons.person_outline,color: AppColors.primaryColor,)),
                                Gap(width*0.04),
                                Text('My Certificates'),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,size: 10,)
                              ],
                            ),
                          ),
                          Gap(height*0.04),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.025),
                            child: Row(
                              children: [
                                Container(
                                    height: height*0.05,
                                    width: height*0.05,
                                    decoration:BoxDecoration(
                                      color: AppColors.profileSecondaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),

                                    child: Icon(Icons.person_outline,color: AppColors.primaryColor,)),
                                Gap(width*0.04),
                                Text('Purchase History'),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,size: 10,)
                              ],
                            ),
                          ),
                          Gap(height*0.04),
                          CustomButton(
                            text: 'Log Out',
                            onPressed: ()async{
                              await Supabase.instance.client
                                  .auth.signOut();
                              navigateToAndReplace(context, LoginScreen());
                            },
                            prefixIcon: Icon(Icons.logout),
                          isLogOut: true,)
                        ],
                      ),
                    ),


                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/core/widgets/custom_text_form_field.dart';
import 'package:your_academy/features/edit_profile/data/repo/edit_profile_repo/edit_profile_repo.dart';
import 'package:your_academy/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:your_academy/features/edit_profile/presentation/cubit/edit_profile_states.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key, required this.name, required this.email, required this.password});

  final String name;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(
        editProfileRepo: EditProfileRepo(),
      ),
      child: EditProfileView(
        name: name,
        email: email,
        password: password,
      ),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    final TextEditingController nameController = TextEditingController(text: name);
    final TextEditingController emailController = TextEditingController(text: email);
    // final TextEditingController passwordController = TextEditingController(text: password);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Edit Profile',
          style: AppTextStyles.s20w700(context),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is UpdateNameAndEmailSuccessStates) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profile updated successfully!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            // Go back to previous screen
            Navigator.pop(context);
          } else if (state is UpdateNameAndEmailErrorStates) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            final cubit = EditProfileCubit.get(context);

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(height * 0.02),
                  const Row(
                    children: [
                      Gap(2),
                      Text('Name'),
                    ],
                  ),
                  Gap(height * 0.01),
                  CustomTextFormField(
                    label: '',
                    isPrefixIcon: false,
                    controller: nameController,
                  ),
                  Gap(height * 0.04),
                  const Row(
                    children: [
                      Gap(2),
                      Text("Email"),
                    ],
                  ),
                  Gap(height * 0.01),
                  CustomTextFormField(
                    controller: emailController,
                    label: '',
                    isPrefixIcon: false,
                  ),
                  Gap(height * 0.09),
                  if (state is UpdateNameAndEmailLoadingStates)
                    const Center(child: CircularProgressIndicator())
                  else
                    CustomButton(
                      text: 'Save Changes',
                      onPressed: () {
                        if (kDebugMode) {
                          print('Email = "${emailController.text}"');
                          print('Trimmed Email = "${emailController.text.trim()}"');

                        }

                        cubit.updateNameAndEmail(
                          nameController.text.trim(),
                          emailController.text.trim(),
                        );
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
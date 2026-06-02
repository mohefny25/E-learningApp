import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:your_academy/core/widgets/custom_button.dart';
import 'package:your_academy/core/widgets/custom_text_form_field.dart';
import 'package:your_academy/features/auth/presentation/screens/login_screen.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key, required this.name, required this.email, required this.password});
   final String name;
   final String email;
   final String password;



   @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final TextEditingController nameController = TextEditingController(text: name);
    final TextEditingController emailController = TextEditingController(text: email);
    final TextEditingController passwordController = TextEditingController(text: password);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Edit Profile',
          style: AppTextStyles.s20w700(context),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: height*0.02,
          horizontal: width*0.05

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(height*0.02),
            Row(
              children: [
                Gap(2),
                Text('Name'),
              ],
            ),
            Gap(height*0.01),
            CustomTextFormField(label: '',
              isPrefixIcon: false,
            controller: nameController,),
            Gap(height*0.04),
            Row(
              children: [
                Gap(2),
                Text("Email"),
              ],
            ),
            Gap(height*0.01),
            CustomTextFormField(
              controller: emailController,
              label: '',
              isPrefixIcon: false,

            ),
            // Gap(height*0.04),
            // Row(
            //   children: [
            //     Gap(2),
            //     Text('password'),
            //   ],
            // ),
            // Gap(height*0.01),
            // CustomTextFormField(label: '', isPrefixIcon: false,),
            Gap(height*0.09),
            CustomButton(text: 'Save Changes', onPressed: (){

            })
          ],
        ),
      ),
    );
  }
}

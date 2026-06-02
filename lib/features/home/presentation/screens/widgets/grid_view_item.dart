import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:your_academy/core/functions.dart';
import 'package:your_academy/core/routing/routes.dart';
import 'package:your_academy/features/course_details/presentation/screens/course_details_screen.dart';
import 'package:your_academy/features/home/data/models/course_model.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class GridViewItem extends StatelessWidget {
   GridViewItem({
    super.key,
    required this.course,
    required this.height,
    required this.width,
     required this.image,
     required this.title,
     required this.price,
  });

  final double height;
  final double width;
  final String image;
  final String title;
  final double price;
  CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: width*0.03, vertical: height*0.013),
      child: Card(
        elevation: 2,
        child: Container(

          decoration: BoxDecoration(
            // border: Border.all(
            //   color: AppColors.borderColor
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:  EdgeInsets.only(
                top: height*0.013,
              right: width*0.03,
              left: width*0.03
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ClipRRect(

                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(


                    child: Image.network(image,
                      fit: BoxFit.fill,
                      height: height*0.11,
                      width: double.infinity,

                    ),
                  ),
                ),
                Gap(height*0.0002),
                Text(title,style: AppTextStyles.s14w600(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.cardTitleColor
                ),),
                Text("$price EGP",style: AppTextStyles.s12w600(context),),
                CustomButton(isSmall: true,text: "Show Details", onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.courseDetailsScreen,
                   arguments: course
                  );
                }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}



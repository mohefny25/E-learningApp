import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/text_styles.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({super.key, required this.height, required this.secondHeader});

  final double height;
  final String secondHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.appName, style: AppTextStyles.s30w700(context)),
            Gap(height * 0.03),
            Text(secondHeader, style: AppTextStyles.s24w600(context)),
          ],
        ),
      ),
    );
  }
}

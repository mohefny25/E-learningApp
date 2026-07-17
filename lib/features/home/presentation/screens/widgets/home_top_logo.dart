import 'package:flutter/material.dart';
import 'package:your_academy/l10n/app_localizations.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class HomeTopLogo extends StatelessWidget {
  const HomeTopLogo({
    super.key,
    required this.height,
    required this.width,
    required this.name,
  });

  final double height;
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(AppRadius.r20),
        bottomRight: Radius.circular(AppRadius.r20),
      ),
      child: Container(
        height: height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.primaryColor),
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.03,
            right: width * 0.03,
            top: height * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.greeting(name), style: AppTextStyles.s18w600(context)),
              Text(
                l10n.welcomeMessage(AppStrings.appName),
                style: AppTextStyles.s20w700(context),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.03),
                child: CustomTextFormField(
                  label: l10n.searchHint,
                  prefixIcon: Icon(Icons.search),
                  isSearch: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
